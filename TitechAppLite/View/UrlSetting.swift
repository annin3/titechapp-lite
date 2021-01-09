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
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Text("カレンダーのURLを入力して下さい")
            HStack{
                TextField("https://", text: $url)
                    .keyboardType(.URL)
                    .autocapitalization(.none)
                Button(action: {
                    if let url2 = URL(string: url) {
                        self.isShowSelect = false
                        UserDefaults.standard.set(url2, forKey: "Url")
                        NotificationCenter.default.post(name: Notification.FinishSave, object: nil)
                        self.presentation.wrappedValue.dismiss()
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
            }.padding()
        }
        
    }
}

struct UrlSetting_Previews: PreviewProvider {
    static var previews: some View {
        UrlSetting()
    }
}
