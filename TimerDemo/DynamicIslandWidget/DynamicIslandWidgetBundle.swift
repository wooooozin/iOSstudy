//
//  DynamicIslandWidgetBundle.swift
//  DynamicIslandWidget
//
//  Created by 효우 on 2023/02/24.
//

import WidgetKit
import SwiftUI

@main
struct DynamicIslandWidgetBundle: WidgetBundle {
    var body: some Widget {
        DynamicIslandWidget()
        DynamicIslandWidgetLiveActivity()
    }
}
