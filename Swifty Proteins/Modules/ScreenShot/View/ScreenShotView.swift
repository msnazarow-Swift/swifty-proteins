// 
//  ScreenShotView.swift
//  Swifty Proteins
//
//  Created by 19733654 on 07.01.2022.
//

import UIKit
import LinkPresentation

class ScreenShotView: UIViewController {
	// MARK: - Properties
	let gap: CGFloat = 10
	let placeholder = "Input your content here ... "
	var placeholderActive = true
	var presenter: ScreenShotViewOutput!

	// MARK: - Views
	let titleTextField: UITextField = {
		let textField = UITextField()
		textField.font = .systemFont(ofSize: 20)
		textField.borderStyle = .roundedRect
		textField.placeholder = "Input your title here ... "
		return textField
	}()

	lazy var contentTextView: UITextView = {
		let textView = UITextView()
		textView.font = .systemFont(ofSize: 17 )
		textView.layer.borderWidth = 1
		textView.delegate = self
		textView.text = placeholder
		textView.textColor = .placeholderText
		textView.layer.cornerRadius = 10
		textView.layer.borderColor = UIColor.lightGray.cgColor
		textView.isScrollEnabled = false
		return textView
	}()

	let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()

	lazy var vstack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [titleTextField, contentTextView, imageView])
		stack.spacing = gap
		stack.axis = .vertical
		stack.distribution = .equalSpacing
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()

	let scrollView: UIScrollView = {
		let view = UIScrollView()
		view.showsVerticalScrollIndicator = false
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	var footerConstraint: NSLayoutConstraint?

	// MARK: - Init
	convenience init(presenter: ScreenShotViewOutput) {
		self.init()
		self.presenter = presenter
	}

	// MARK: - Lifecycle Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		subscribeKeyboardNotifications()
		presenter.viewDidLoad()
	}

	private func setupUI() {
		view.backgroundColor = UIColor.sceneBackground
		setupNavigationItem()
		addSubviews()
		setupConstraints()
	}

	private func setupNavigationItem() {
		let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(screenshotButtonTapped))
		navigationItem.setRightBarButton(shareButton, animated: true)
	}

	private func addSubviews() {
		view.addSubview(scrollView)
		scrollView.addSubview(vstack)
	}

	@objc func screenshotButtonTapped(_ sender: UIButton) {
		presenter.shareButtonTapped(self, title: titleTextField.text, text: contentTextView.text)
	}


	private func setupConstraints() {
		NSLayoutConstraint.activate([
			contentTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),

			vstack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: gap),
			vstack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -gap),
			vstack.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: gap),
			vstack.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -gap),

			scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: gap),
			scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: gap),
			scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -gap)
		])
		footerConstraint = scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -gap)
		footerConstraint?.isActive = true
	}
}

// MARK: - View Input (Presenter -> View)
extension ScreenShotView: ScreenShotViewInput {
	func setImage(_ image: UIImage) {
		imageView.image = image
		let width = image.size.width
		let heigh = image.size.height
		let coeff = heigh / width
		let realwidth = min(view.frame.width - 4 * gap, width)
		let realHeight = realwidth * coeff
		imageView.heightAnchor.constraint(equalToConstant: realHeight).isActive = true
	}

	func showError(_ message: String) {
		let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default))
		present(alert, animated: true)
	}

	func showMessage(title: String, text: String) {
		let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default))
		present(alert, animated: true)
	}
}

// MARK: - UIActivityItemSource
extension ScreenShotView: UIActivityItemSource {
	func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
		titleTextField.text ?? ""
	}

	func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
		titleTextField.text ?? ""
	}

	func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
		contentTextView.text ?? ""
	}

	func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
		let metadata = LPLinkMetadata()
		metadata.title = titleTextField.text
		metadata.iconProvider = NSItemProvider(object: imageView.image ?? UIImage())
		metadata.originalURL = URL(fileURLWithPath: contentTextView.text)
		return metadata
	}
}

// MARK: - UITextViewDelegate
extension ScreenShotView: UITextViewDelegate {
	func textViewDidBeginEditing(_ textView: UITextView) {
		if placeholderActive {
			contentTextView.text = ""
			placeholderActive = false
			contentTextView.textColor = .label
		}
	}

	func textViewDidEndEditing(_ textView: UITextView) {
		if contentTextView.text.isEmpty {
			placeholderActive = true
			contentTextView.text = placeholder
			contentTextView.textColor = .placeholderText
		}
	}
}

// MARK: - KeyboardNotifications
private extension ScreenShotView {
	private func subscribeKeyboardNotifications() {
		let notificationCenter = NotificationCenter.default
		notificationCenter.addObserver(
			self,
			selector: #selector(keyboardWillHide),
			name: UIResponder.keyboardWillHideNotification,
			object: nil
		)
		notificationCenter.addObserver(
			self,
			selector: #selector(keyboardWillShow),
			name: UIResponder.keyboardWillShowNotification,
			object: nil
		)
	}

	@objc private func keyboardWillShow(_ notification: Notification) {
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
			footerConstraint?.constant = -keyboardSize.height + view.safeAreaInsets.bottom
		}
	}

	@objc private func keyboardWillHide(_ notification: Notification) {
		footerConstraint?.constant = 0
	}
}
