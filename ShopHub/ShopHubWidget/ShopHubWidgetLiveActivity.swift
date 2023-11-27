//
//  ShopHubWidgetLiveActivity.swift
//  ShopHubWidget
//
//  Created by CHENGTAO on 11/27/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ShopHubWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ShopHubWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ShopHubWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ShopHubWidgetAttributes {
    fileprivate static var preview: ShopHubWidgetAttributes {
        ShopHubWidgetAttributes(name: "World")
    }
}

extension ShopHubWidgetAttributes.ContentState {
    fileprivate static var smiley: ShopHubWidgetAttributes.ContentState {
        ShopHubWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ShopHubWidgetAttributes.ContentState {
         ShopHubWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ShopHubWidgetAttributes.preview) {
   ShopHubWidgetLiveActivity()
} contentStates: {
    ShopHubWidgetAttributes.ContentState.smiley
    ShopHubWidgetAttributes.ContentState.starEyes
}
