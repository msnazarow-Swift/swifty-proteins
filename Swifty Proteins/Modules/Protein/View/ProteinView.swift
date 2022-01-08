// 
//  ProteinView.swift
//  Swifty Proteins
//
//  Created by Clothor- on 12/26/21.
//

import UIKit
import SceneKit

class ProteinView: UIViewController, UIPopoverPresentationControllerDelegate {
    // MARK: - Properties
    var presenter: ProteinViewOutput!
    
    private var elements: Elements = .init()
    private var molecule: Molecule = .init()

    private let colorPallete = CPKColor.shared
	private let sphereRadius: CGFloat = 0.2
	private let cylinderRadius: CGFloat = 0.1
	private let cylinderColor: UIColor = UIColor(red: 0.53, green: 0.56, blue: 0.56, alpha: 1.00)

	// MARK: - Views
    private lazy var scnView: SCNView = {
        let scnView = SCNView()
        scnView.translatesAutoresizingMaskIntoConstraints = false
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
        scnView.backgroundColor = .clear
        scnView.scene = SCNScene()
		scnView.scene?.background.contents = UIColor.sceneBackground.withAlphaComponent(0.1)
        return scnView
    }()

    private lazy var spinner: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Init
    convenience init(presenter: ProteinViewOutput) {
        self.init()
        self.presenter = presenter
    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad(self)
    }

    private func setupUI() {
		view.backgroundColor = .sceneBackground
		setupNavigationItem()
        addSubviews()
        setupConstraints()
    }

	private func setupNavigationItem() {
		let screenshotButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(shareButtonTapped))
		navigationItem.setRightBarButton(screenshotButton, animated: true)
	}

    private func addSubviews() {
		view.addSubview(spinner)
        view.addSubview(scnView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scnView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scnView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scnView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scnView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

			spinner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			spinner.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			spinner.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			spinner.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

	@objc func shareButtonTapped() {
		if let image = scnView.snapshot().trimmingTransparentPixels(maximumAlphaChannel: 150) {
			presenter.shareButtonTapped(self, image: image)
		}
	}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: scnView)
        let hitList = scnView.hitTest(location, options: nil)
        if let hitObject = hitList.first {
            showAtomInfo(hitObject: hitObject, location: location)
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

// MARK: - View Input (Presenter -> View)
extension ProteinView: ProteinViewInput {
    func setElementsInfo(_ elements: Elements) {
        self.elements = elements
    }
    
    func showMolecule(_ molecule: Molecule) {
        self.molecule = molecule
        fillScene(molecule)
		spinner.stopAnimating()
    }
    
    private func fillScene(_ molecule: Molecule) {
        guard let scene = scnView.scene else { return }
        let camera = createCameraNode(atoms: molecule.atoms)
        scene.rootNode.addChildNode(camera)
        for atom in molecule.atoms {
            let newAtom = createAtomNode(atom: atom)
            scene.rootNode.addChildNode(newAtom)
            for connect in atom.connects {
                guard let contact = molecule.atoms.first(where: { $0.id == connect }) else { continue }
                let cylindr = createCylinderNode(firstAtom: atom, secondAtom: contact)
                scene.rootNode.addChildNode(cylindr)
            }
        }
    }
    
    private func createCameraNode(atoms: [Atom]) -> SCNNode {
        let position: Double = atoms.count < 150 ? 35 : 70
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(0, 0, position)
        return cameraNode
    }
    
    private func createAtomNode(atom: Atom) -> SCNNode {
        let atomSphere = SCNSphere(radius: sphereRadius)
        atomSphere.firstMaterial?.diffuse.contents = colorPallete.getColorFor(atom.type)
        atomSphere.firstMaterial?.lightingModel = .physicallyBased
        let atomNode = SCNNode(geometry: atomSphere)
        atomNode.position = atom.vector
        return atomNode
    }
    
    private func createCylinderNode(firstAtom: Atom, secondAtom: Atom) -> SCNNode {
        let height = GLKVector3Distance(
            SCNVector3ToGLKVector3(firstAtom.vector),
            SCNVector3ToGLKVector3(secondAtom.vector)
        )
        let cylindre = SCNCylinder(radius: cylinderRadius,
                                   height: CGFloat(height)
        )
        cylindre.firstMaterial?.diffuse.contents = cylinderColor
        cylindre.firstMaterial?.lightingModel = .physicallyBased

        let cylinderNode = SCNNode(geometry: cylindre)
        cylinderNode.position = SCNVector3(
            (firstAtom.vector.x + secondAtom.vector.x) / 2,
            (firstAtom.vector.y + secondAtom.vector.y) / 2,
            (firstAtom.vector.z + secondAtom.vector.z) / 2
        )
        cylinderNode.eulerAngles = SCNVector3Make(
            Float(Double.pi/2),
            acos((secondAtom.vector.z - firstAtom.vector.z) / height),
            atan2((secondAtom.vector.y - firstAtom.vector.y), (secondAtom.vector.x - firstAtom.vector.x))
        )
        return cylinderNode
    }

	func setTitle(_ title: String) {
		self.title = title
	}

	func showError(_ message: String) {
		let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default))
		present(alert, animated: true)
		spinner.stopAnimating()
	}

	func showMessage(title: String, text: String) {
		let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default))
		present(alert, animated: true)
		spinner.stopAnimating()
	}
    
    private func showAtomInfo(hitObject: SCNHitTestResult, location: CGPoint) {
        guard let atom = molecule.atoms.first(where: { $0.vector == hitObject.node.position }),
              let atomInfo = elements.elements.first(where: { $0.symbol == atom.type })
        else { return }
        let popoverView = ProteinPopoverView()
        popoverView.modalPresentationStyle = .popover
        popoverView.popoverPresentationController?.permittedArrowDirections = .any
        popoverView.preferredContentSize = CGSize(width: 250, height: 250)
        popoverView.popoverPresentationController?.sourceView = scnView
        popoverView.popoverPresentationController?.sourceRect = CGRect(x: location.x, y: location.y, width: 0, height: 0)
        popoverView.popoverPresentationController?.delegate = self
        popoverView.configure(element: atomInfo)
        self.present(popoverView, animated: true, completion: nil)
    }
}
