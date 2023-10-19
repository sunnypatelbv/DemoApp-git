//
//  ExpandableCellDataModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 04/10/23.
//

import Foundation

struct ExpandableCellDataModel {
    let title: String
    let description: String
    let iconName: String
    var isExpanded = false
    
    static let mockedData: [ExpandableCellDataModel] = [
        ExpandableCellDataModel(title: "Profile", description: "View and edit your profile information, including your name, email address, phone number, and profile picture. You can also update your password and manage your account settings here.", iconName: "person"),
        ExpandableCellDataModel(title: "Notifications", description: "Choose which notifications you want to receive, including push notifications, email notifications, and in-app notifications. You can customize the type of notifications you receive for different events and actions in the app.", iconName: "bell"),
        ExpandableCellDataModel(title: "Privacy", description: "Manage your privacy settings, including who can see your profile information and what information is visible to others. You can also control your data sharing preferences and manage your account security settings.", iconName: "lock"),
        ExpandableCellDataModel(title: "Billing", description: "View your billing information and manage your payment methods, including credit cards, bank accounts, and other payment options. You can also review your billing history and manage your billing preferences.", iconName: "creditcard"),
        ExpandableCellDataModel(title: "Support", description: "Get help and support for using the app, including troubleshooting tips, answers to frequently asked questions, and access to our customer support team. You can also submit feedback and feature requests to help us improve the app.", iconName: "questionmark.circle"),
        ExpandableCellDataModel(title: "About", description: "Learn more about the app and its developers, including our mission, vision, and values. You can also see our latest news and updates, and connect with us on social media.", iconName: "info.circle"),
        ExpandableCellDataModel(title: "Settings", description: "Customize your app settings, including your language preferences, theme settings, and notification preferences. You can also manage your account security settings and adjust other app-specific settings.", iconName: "gear"),
        ExpandableCellDataModel(title: "Feedback", description: "Provide feedback and suggestions for the app, including feature requests, bug reports, and other comments. Your feedback helps us improve the app and deliver a better user experience.", iconName: "bubble.left.and.bubble.right"),
        ExpandableCellDataModel(title: "Terms and Conditions", description: "View the terms and conditions for using the app, including our privacy policy, user agreement, and other legal documents. You can also learn more about your rights and responsibilities as a user of the app.", iconName: "doc.text"),
        ExpandableCellDataModel(title: "Logout", description: "Sign out of your account and clear your session data. You will need to log in again to access your account and use the app.", iconName: "arrow.left.square")
    ]
    
}



