//
//  ICalUrlSetting.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/12/06.
//  Copyright © 2020 annin3. All rights reserved.
//

import SwiftUI
import UIKit

struct ICalUrlSetting: View {
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationBarTitle("iCalURL設定", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigation) {
                          Button("戻る") {print("new")}
                }
            }
        }
    }
}



struct ICalUrlSetting_Previews: PreviewProvider {
    static var previews: some View {
        ICalUrlSetting()
    }
}
