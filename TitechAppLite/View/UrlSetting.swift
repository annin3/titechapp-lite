//
//  UrlSetting.swift
//  TitechAppLite
//
//  Created by 中山俊太 on 2020/12/18.
//  Copyright © 2020 annin3. All rights reserved.
//

import SwiftUI

extension View {
    func onReceive(_ name: Notification.Name,
                   center: NotificationCenter = .default,
                   object: AnyObject? = nil,
                   perform action: @escaping (Notification) -> Void) -> some View {
        self.onReceive(
            center.publisher(for: name, object: object), perform: action
        )
    }
}


struct UrlSetting: View {
    @State private var url = ""
    @State private var isShowSelect = false
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Text("カレンダーのURLを入力して下さい")
            HStack{
                TextField("https://", text: $url)
                Button(action: {
                    if url.hasPrefix("https://") {
                        self.isShowSelect = false
                        UserDefaults.standard.set(url, forKey: "Url")
                        NotificationCenter.default.post(name: NSNotification.FinishSave, object: nil)
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
