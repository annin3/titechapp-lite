//
//  UrlSetting.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/12/18.
//  Copyright © 2020 annin3. All rights reserved.
//

import SwiftUI

struct UrlSetting: View {
    @State private var url = ""
    @State private var isShowSelect = false
    var body: some View {
        VStack{
            Text("カレンダーのURLを入力して下さい")
            HStack{
                TextField("https://", text: $url)
                Button(action: {
                    if url.hasPrefix("https://") {
                        self.isShowSelect = false
                        UserDefaults.standard.set(url, forKey: "Url")
                    } else {
                        self.isShowSelect = true
                    }
                }){
                    Text("更新")
                }
                .alert(isPresented: $isShowSelect) {
                    Alert(title: Text("URLが誤っています"),
                          message: Text("正しいURLを入力して下さい。"),
                          dismissButton: .default(Text("OK")))
                }
            }
        }
        
    }
}

struct UrlSetting_Previews: PreviewProvider {
    static var previews: some View {
        UrlSetting()
    }
}
