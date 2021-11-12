//
//  SignUpView.swift
//  koala
//
//  Created by 정태훈 on 2021/10/18.
//

import SwiftUI
import AVFoundation
import PhotosUI

struct SignUpScreen: View {
    @Binding var popToRoot: Bool
    @ObservedObject var viewModel: SignUpViewModel
    @State var currentPage: Int
    
    init(popToRoot: Binding<Bool>) {
        self._popToRoot = popToRoot
        self.currentPage = 0
        self.viewModel = SignUpViewModel()
    }
    
    var body: some View {
        VStack(spacing: 0){
            Divider()
            VStack(spacing: 0){
                PageView(selection: self.$currentPage,
                         indexDisplayMode: .always,
                         indexBackgroundDisplayMode: .never) {
                    AgreementView()
                        .environmentObject(self.viewModel)
                        .tag(0)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(Rectangle())
                        .gesture(DragGesture())
                    AuthorityView()
                        .environmentObject(self.viewModel)
                        .tag(1)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(Rectangle())
                        .gesture(DragGesture())
                    AddUserView()
                        .environmentObject(self.viewModel)
                        .tag(2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(Rectangle())
                        .gesture(DragGesture())
                }
                         .padding(.bottom, 16)
                Button(action: {
                    if(self.viewModel.canPage > self.currentPage) {
                        if(self.currentPage == 1) {
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in
                                        if didAllow {
                                            print("Push: 권한 허용")
                                        } else {
                                            print("Push: 권한 거부")
                                        }
                                    })
                            AVCaptureDevice.requestAccess(for: .video, completionHandler: {accessGranted in
                                        
                                    })
                            PHPhotoLibrary.requestAuthorization(for: .readWrite, handler: {accessGranted in
                                
                            })
                            self.currentPage += 1
                        } else {
                            self.currentPage += 1
                        }
                    }
                    
                }) {
                    Text(self.currentPage == 2 ? "완료" : "다음")
                        .font(.custom("NotoSansKR-Medium", size: 14))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 13, leading: 0, bottom: 14, trailing: 0))
                }
                .background(self.viewModel.canPage > self.currentPage ? Color("PrimaryBlack") : Color("DeactivateIndicatorColor"))
                .padding(.bottom, 16)
            }.padding(.horizontal, 16)
        }.onDisappear {
            //self.viewModel.dispose()
        }
        .navigationTitle("회원가입")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen(popToRoot: .constant(false))
    }
}
