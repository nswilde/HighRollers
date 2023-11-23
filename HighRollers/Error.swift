//
//  Error.swift
//  HighRollers
//
//  Created by Nikki Wilde on 23/11/23.
//

import SwiftUI

enum ImageDataError: Error, LocalizedError {
    case readError
    case saveImageError
    
    var errorDescription: String? {
        switch self {
        case .readError:
            return NSLocalizedString("Failed", comment: "")
        case .saveImageError:
            return NSLocalizedString("Failed to save", comment: "")
        }
    }
    
    struct ErrorType: Identifiable {
        let id = UUID()
        let error: ImageDataError
        var message: String {
            error.localizedDescription
        }
        let button = Button("OK", role: .cancel) {}
    }
}
