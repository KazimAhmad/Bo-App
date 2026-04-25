//
//  BoAlertView.swift
//  Bo
//
//  Created by Kazim Ahmad on 25/04/2026.
//

import SwiftUI

enum AlertType {
    case empty
    case error
    case warning
    case info
    
    var title: String {
        switch self {
        case .empty:
            return "Empty"
        case .error:
            return "Error!"
        case .warning:
            return "Warning"
        case .info:
            return "Info:"
        }
    }
    
    var message: String {
        switch self {
        case .empty:
            return "No data available at the moment."
        case .error:
            return "Unexpected error occured while processing your request. Please try again later."
        case .warning:
            return "Are you sure you would like to proceed?"
        case .info:
            return ""
        }
    }
    
    var image: Image {
        switch self {
            case .empty:
            return Images.empty
        case .error:
            return Images.error
        case .warning:
            return Images.warning
        case .info:
            return Images.info
        }
    }
}

struct AlertConfig {
    let title: String
    let message: String
    let type: AlertType
    let confirmTitle: String
    let cancelTitle: String?
    let confirmAction: (() -> Void)?
    let cancelAction: (() -> Void)?
    
    init(message: String = "Unexpected error occured while processing your request. Please try again later.",
         type: AlertType = .error,
         confirmTitle: String = "Try Again",
         cancelTitle: String? = "Cancel",
         confirmAction: (() -> Void)? = nil,
         cancelAction:  (() -> Void)? = nil) {
        self.title = type.title
        self.message = message
        self.type = type
        self.confirmTitle = confirmTitle
        self.cancelTitle = cancelTitle
        self.cancelAction = cancelAction
        self.confirmAction = confirmAction
    }
}

struct BoAlertView: View {
    let config: AlertConfig
    
    init(config: AlertConfig = AlertConfig()) {
        self.config = config
    }
    
    var body: some View {
        ZStack {
            Color(.clear)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 16) {
                    config.type.image
                        .resizable()
                        .frame(width: 28, height: 28)
                    Text(config.title)
                        .font(AppTypography.medium(size: 28))
                    Spacer()
                }
                Text(config.type == .empty ? config.type.message : config.message)
                    .font(AppTypography.lightApp())
                HStack {
                    if config.type != .empty {
                        Spacer()
                        if let cancel = config.cancelTitle {
                            Button {
                                config.cancelAction?()
                            } label: {
                                Text(cancel)
                            }
                            .buttonStyle(YellowAndBlackButton())
                            .frame(width: 120)
                        }
                        Button {
                            config.confirmAction?()
                        } label: {
                            Text(config.confirmTitle)
                        }
                        .buttonStyle(PurpleAndWhiteButton())
                        .frame(width: 120)
                    }
                }
            }
            .padding()
            .foregroundStyle(Color(uiColor: .systemBackground))
            .frame(maxWidth: .infinity)
            .background(
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0,
                                                          bottomLeading: Constants.alertCornerRadius,
                                                          bottomTrailing: 0.0, topTrailing: Constants.alertCornerRadius))
                .fill(Color.primary)
                .shadow(color: .accent.opacity(0.8),
                        radius: Constants.shadowRadius)
            )
            .padding(.horizontal)
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        Images.drowningBojack
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    Spacer()
                }
                .offset(y: -40)
            }
        }
    }
}

#Preview {
    BoAlertView()
}
