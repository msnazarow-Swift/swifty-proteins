//
//  CPKColor.swift
//  Swifty Proteins
//
//  Created by Clothor- on 1/6/22.
//

import UIKit

struct CPKColor {
    static let shared = CPKColor()

    private init() {}

    private let colors = [
        "H": UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00),
        "HE": UIColor(red: 0.85, green: 1.00, blue: 1.00, alpha: 1.00),
        "LI": UIColor(red: 0.80, green: 0.50, blue: 1.00, alpha: 1.00),
        "BE": UIColor(red: 0.76, green: 1.00, blue: 0.00, alpha: 1.00),
        "B": UIColor(red: 1.00, green: 0.71, blue: 0.71, alpha: 1.00),
        "C": UIColor(red: 0.56, green: 0.56, blue: 0.56, alpha: 1.00),
        "N": UIColor(red: 0.19, green: 0.31, blue: 0.97, alpha: 1.00),
        "O": UIColor(red: 1.00, green: 0.05, blue: 0.05, alpha: 1.00),
        "F": UIColor(red: 0.56, green: 0.88, blue: 0.31, alpha: 1.00),
        "NE": UIColor(red: 0.70, green: 0.89, blue: 0.96, alpha: 1.00),
        "NA": UIColor(red: 0.67, green: 0.36, blue: 0.95, alpha: 1.00),
        "MG": UIColor(red: 0.54, green: 1.00, blue: 0.00, alpha: 1.00),
        "AL": UIColor(red: 0.75, green: 0.65, blue: 0.65, alpha: 1.00),
        "SI": UIColor(red: 0.94, green: 0.78, blue: 0.63, alpha: 1.00),
        "P": UIColor(red: 1.00, green: 0.50, blue: 0.00, alpha: 1.00),
        "S": UIColor(red: 1.00, green: 1.00, blue: 0.19, alpha: 1.00),
        "CL": UIColor(red: 0.12, green: 0.94, blue: 0.12, alpha: 1.00),
        "AR": UIColor(red: 0.50, green: 0.82, blue: 0.89, alpha: 1.00),
        "K": UIColor(red: 0.56, green: 0.25, blue: 0.83, alpha: 1.00),
        "CA": UIColor(red: 0.24, green: 1.00, blue: 0.00, alpha: 1.00),
        "SC": UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00),
        "TI": UIColor(red: 0.75, green: 0.76, blue: 0.78, alpha: 1.00),
        "V": UIColor(red: 0.65, green: 0.65, blue: 0.67, alpha: 1.00),
        "CR": UIColor(red: 0.54, green: 0.60, blue: 0.78, alpha: 1.00),
        "MN": UIColor(red: 0.61, green: 0.48, blue: 0.78, alpha: 1.00),
        "FE": UIColor(red: 0.88, green: 0.40, blue: 0.20, alpha: 1.00),
        "CO": UIColor(red: 0.94, green: 0.56, blue: 0.63, alpha: 1.00),
        "NI": UIColor(red: 0.31, green: 0.82, blue: 0.31, alpha: 1.00),
        "CU": UIColor(red: 0.78, green: 0.50, blue: 0.20, alpha: 1.00),
        "ZN": UIColor(red: 0.49, green: 0.50, blue: 0.69, alpha: 1.00),
        "GA": UIColor(red: 0.76, green: 0.56, blue: 0.56, alpha: 1.00),
        "GE": UIColor(red: 0.40, green: 0.56, blue: 0.56, alpha: 1.00),
        "AS": UIColor(red: 0.74, green: 0.50, blue: 0.89, alpha: 1.00),
        "SE": UIColor(red: 1.00, green: 0.63, blue: 0.00, alpha: 1.00),
        "BR": UIColor(red: 0.65, green: 0.16, blue: 0.16, alpha: 1.00),
        "KR": UIColor(red: 0.36, green: 0.72, blue: 0.82, alpha: 1.00),
        "RB": UIColor(red: 0.44, green: 0.18, blue: 0.69, alpha: 1.00),
        "SR": UIColor(red: 0.00, green: 1.00, blue: 0.00, alpha: 1.00),
        "Y": UIColor(red: 0.58, green: 1.00, blue: 1.00, alpha: 1.00),
        "ZR": UIColor(red: 0.58, green: 0.88, blue: 0.88, alpha: 1.00),
        "NB": UIColor(red: 0.45, green: 0.76, blue: 0.79, alpha: 1.00),
        "MO": UIColor(red: 0.33, green: 0.71, blue: 0.71, alpha: 1.00),
        "TC": UIColor(red: 0.23, green: 0.62, blue: 0.62, alpha: 1.00),
        "RU": UIColor(red: 0.14, green: 0.56, blue: 0.56, alpha: 1.00),
        "RH": UIColor(red: 0.04, green: 0.49, blue: 0.55, alpha: 1.00),
        "PD": UIColor(red: 0.00, green: 0.41, blue: 0.52, alpha: 1.00),
        "AG": UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.00),
        "CD": UIColor(red: 1.00, green: 0.85, blue: 0.56, alpha: 1.00),
        "IN": UIColor(red: 0.65, green: 0.46, blue: 0.45, alpha: 1.00),
        "SN": UIColor(red: 0.40, green: 0.50, blue: 0.50, alpha: 1.00),
        "SB": UIColor(red: 0.62, green: 0.39, blue: 0.71, alpha: 1.00),
        "TE": UIColor(red: 0.83, green: 0.48, blue: 0.00, alpha: 1.00),
        "I": UIColor(red: 0.58, green: 0.00, blue: 0.58, alpha: 1.00),
        "XE": UIColor(red: 0.26, green: 0.62, blue: 0.69, alpha: 1.00),
        "CS": UIColor(red: 0.34, green: 0.09, blue: 0.56, alpha: 1.00),
        "BA": UIColor(red: 0.00, green: 0.79, blue: 0.00, alpha: 1.00),
        "LA": UIColor(red: 0.44, green: 0.83, blue: 1.00, alpha: 1.00),
        "CE": UIColor(red: 1.00, green: 1.00, blue: 0.78, alpha: 1.00),
        "PR": UIColor(red: 0.85, green: 1.00, blue: 0.78, alpha: 1.00),
        "ND": UIColor(red: 0.78, green: 1.00, blue: 0.78, alpha: 1.00),
        "PM": UIColor(red: 0.64, green: 1.00, blue: 0.78, alpha: 1.00),
        "SM": UIColor(red: 0.56, green: 1.00, blue: 0.78, alpha: 1.00),
        "EU": UIColor(red: 0.38, green: 1.00, blue: 0.78, alpha: 1.00),
        "GD": UIColor(red: 0.27, green: 1.00, blue: 0.78, alpha: 1.00),
        "TB": UIColor(red: 0.19, green: 1.00, blue: 0.78, alpha: 1.00),
        "DY": UIColor(red: 0.12, green: 1.00, blue: 0.78, alpha: 1.00),
        "HO": UIColor(red: 0.00, green: 1.00, blue: 0.61, alpha: 1.00),
        "ER": UIColor(red: 0.00, green: 0.90, blue: 0.46, alpha: 1.00),
        "TM": UIColor(red: 0.00, green: 0.83, blue: 0.32, alpha: 1.00),
        "YB": UIColor(red: 0.00, green: 0.75, blue: 0.22, alpha: 1.00),
        "LU": UIColor(red: 0.00, green: 0.67, blue: 0.14, alpha: 1.00),
        "HF": UIColor(red: 0.30, green: 0.76, blue: 1.00, alpha: 1.00),
        "TA": UIColor(red: 0.30, green: 0.65, blue: 1.00, alpha: 1.00),
        "W": UIColor(red: 0.13, green: 0.58, blue: 0.84, alpha: 1.00),
        "RE": UIColor(red: 0.15, green: 0.49, blue: 0.67, alpha: 1.00),
        "OS": UIColor(red: 0.15, green: 0.40, blue: 0.59, alpha: 1.00),
        "IR": UIColor(red: 0.09, green: 0.33, blue: 0.53, alpha: 1.00),
        "PT": UIColor(red: 0.82, green: 0.82, blue: 0.88, alpha: 1.00),
        "AU": UIColor(red: 1.00, green: 0.82, blue: 0.14, alpha: 1.00),
        "HG": UIColor(red: 0.72, green: 0.72, blue: 0.82, alpha: 1.00),
        "TL": UIColor(red: 0.65, green: 0.33, blue: 0.30, alpha: 1.00),
        "PB": UIColor(red: 0.34, green: 0.35, blue: 0.38, alpha: 1.00),
        "BI": UIColor(red: 0.62, green: 0.31, blue: 0.71, alpha: 1.00),
        "PO": UIColor(red: 0.67, green: 0.36, blue: 0.00, alpha: 1.00),
        "AT": UIColor(red: 0.46, green: 0.31, blue: 0.27, alpha: 1.00),
        "RN": UIColor(red: 0.26, green: 0.51, blue: 0.59, alpha: 1.00),
        "FR": UIColor(red: 0.26, green: 0.00, blue: 0.40, alpha: 1.00),
        "RA": UIColor(red: 0.00, green: 0.49, blue: 0.00, alpha: 1.00),
        "AC": UIColor(red: 0.44, green: 0.67, blue: 0.98, alpha: 1.00),
        "TH": UIColor(red: 0.00, green: 0.73, blue: 1.00, alpha: 1.00),
        "PA": UIColor(red: 0.00, green: 0.63, blue: 1.00, alpha: 1.00),
        "U": UIColor(red: 0.00, green: 0.56, blue: 1.00, alpha: 1.00),
        "NP": UIColor(red: 0.00, green: 0.50, blue: 1.00, alpha: 1.00),
        "PU": UIColor(red: 0.00, green: 0.42, blue: 1.00, alpha: 1.00),
        "AM": UIColor(red: 0.33, green: 0.36, blue: 0.95, alpha: 1.00),
        "CM": UIColor(red: 0.47, green: 0.36, blue: 0.89, alpha: 1.00),
        "BK": UIColor(red: 0.54, green: 0.31, blue: 0.89, alpha: 1.00),
        "CF": UIColor(red: 0.63, green: 0.21, blue: 0.83, alpha: 1.00),
        "ES": UIColor(red: 0.70, green: 0.12, blue: 0.83, alpha: 1.00),
        "FM": UIColor(red: 0.70, green: 0.12, blue: 0.73, alpha: 1.00),
        "MD": UIColor(red: 0.70, green: 0.05, blue: 0.65, alpha: 1.00),
        "NO": UIColor(red: 0.74, green: 0.05, blue: 0.53, alpha: 1.00),
        "LR": UIColor(red: 0.78, green: 0.00, blue: 0.40, alpha: 1.00),
        "RF": UIColor(red: 0.80, green: 0.00, blue: 0.35, alpha: 1.00),
        "DB": UIColor(red: 0.82, green: 0.00, blue: 0.31, alpha: 1.00),
        "SG": UIColor(red: 0.85, green: 0.00, blue: 0.27, alpha: 1.00),
        "BH": UIColor(red: 0.88, green: 0.00, blue: 0.22, alpha: 1.00),
        "HS": UIColor(red: 0.90, green: 0.00, blue: 0.18, alpha: 1.00),
        "MT": UIColor(red: 0.92, green: 0.00, blue: 0.15, alpha: 1.00)
    ]

    func getColorFor(_ atom: String) -> UIColor {
        var color: UIColor?
        if let atomColor = colors[atom] {
            color = atomColor
        }
        return color ?? UIColor(red: 1.00, green: 0.08, blue: 0.58, alpha: 1.00)
    }
}
