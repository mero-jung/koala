//
//  LogInView.swift
//  koala
//
//  Created by 정태훈 on 2021/10/17.
//

import SwiftUI
import AuthenticationServices

struct LoginScreen: View {
    enum Field: Hashable {
        case id, password
    }
    @State var popToRoot : Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var loginViewModel: LoginViewModel
    @State var id: String = ""
    @State var password: String = ""
    @State var isPersist: Bool = true
    @FocusState var focusField: Field?
    
    init() {
        self.loginViewModel = LoginViewModel()
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 16) {
                Spacer()
                
                Image("AppLogo")
                    .padding(.bottom, 11)
                
                HStack {
                    TextField("", text: self.$id)
                        .font(.custom("NotoSansKR-Regular", size: 14))
                        .foregroundColor(Color("PrimaryBlack"))
                        .autocapitalization(.none)
                        .focused($focusField, equals: .id)
                        .submitLabel(.next)
                        .placeholder(when: self.id.isEmpty) {
                            Text("아이디")
                                .font(.custom("NotoSansKR-Regular", size: 14))
                                .foregroundColor(Color("DeactivateColor"))
                        }
                        .padding(EdgeInsets(top: 14, leading: 16, bottom: 13, trailing: 16))
                }
                .border(focusField != nil && focusField == .id ? Color("PrimaryBlack") : Color("DisableColor"))
                .animation(.easeInOut)
                
                VStack(spacing: 8) {
                    HStack {
                        SecureField("", text: self.$password)
                            .font(.custom("NotoSansKR-Regular", size: 14))
                            .foregroundColor(Color("PrimaryBlack"))
                            .autocapitalization(.none)
                            .focused($focusField, equals: .password)
                            .submitLabel(.done)
                            .placeholder(when: self.password.isEmpty) {
                                Text("비밀번호 입력")
                                    .font(.custom("NotoSansKR-Regular", size: 14))
                                    .foregroundColor(Color("DeactivateColor"))
                            }
                            .padding(EdgeInsets(top: 14, leading: 16, bottom: 13, trailing: 16))
                    }.border(focusField != nil && focusField == .password ? Color("PrimaryBlack") : Color("DisableColor"))
                        .animation(.easeInOut)
                    HStack {
                        Toggle(isOn: self.$isPersist) {
                            
                        }
                        .toggleStyle(ColoredToggleStyle(
                            label: "로그인 상태 유지",
                            labelStyle: Font.custom("NotoSansKR-Regular", size: 12),
                            labelColor: Color("DeactivateColor"),
                            onColor: Color("PrimaryOrange"),
                            offColor: Color("DisableColor"),
                            thumbColor: Color("PrimaryOrange"),
                            onThumbColor: Color.white
                        ))
                        Spacer()
                    }
                    
                    
                    
                }.padding(.bottom, 16)
                
                Button(action: {
                    if id.isEmpty {
                        focusField = .id
                    } else if password.isEmpty {
                        focusField = .password
                    } else {
                        focusField = nil
                        self.loginViewModel.login()
                    }
                }) {
                    Text("로그인")
                        .font(.custom("NotoSansKR-Medium", size: 14))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 13, leading: 0, bottom: 14, trailing: 0))
                }
                .background(Color("PrimaryBlack"))
                .padding(.bottom, 8)
                
                HStack(spacing: 9.5){
                    Button(action: {
                        
                    }) {
                        Text("아이디 찾기")
                            .font(.custom("NotoSansKR-Regular", size: 12))
                            .foregroundColor(Color("DeactivateColor"))
                    }
                    
                    Divider()
                    
                    NavigationLink(
                        destination: SignUpScreen(
                            popToRoot: self.$popToRoot
                        )
                    ) {
                        Text("회원가입")
                            .font(.custom("NotoSansKR-Regular", size: 12))
                            .foregroundColor(Color("DeactivateColor"))
                    }
                    
                    Divider()
                    
                    Button(action: {
                        
                    }) {
                        Text("비밀번호 찾기")
                            .font(.custom("NotoSansKR-Regular", size: 12))
                            .foregroundColor(Color("DeactivateColor"))
                    }
                }.frame(height: 15)
                    .padding(.bottom, 16)
                
                VStack(spacing: 8){
                    Text("SNS로 로그인하기")
                        .font(.custom("NotoSansKR-Regular", size: 12))
                        .foregroundColor(Color("DeactivateColor"))
                    HStack(spacing: 24){
                        Button(action: {
                            
                        }) {
                            Image("KakaoButton")
                        }
                        
                        Button(action: {
                            
                        }) {
                            Image("NaverButton")
                        }
                        
                        Button(action: {
                            
                        }) {
                            Image("GoogleButton")
                        }
                        
                        Button(action: {
                            
                        }) {
                            Image("AppleButton")
                        }
                    }
                }.padding(.bottom, 54)
                
                Button(action: {
                    
                }) {
                    Text("비회원으로 이용하기")
                        .font(.custom("NotoSansKR-Regular", size: 14))
                        .foregroundColor(Color("DeactivateColor"))
                        .underline(color: Color("DeactivateColor"))
                }.padding(.bottom, 80)
                
            }
            .padding(.horizontal, 16)
            .onSubmit {
                switch focusField {
                case .id:
                    focusField = .password
                case .password:
                    self.loginViewModel.login()
                case .none:
                    focusField = .id
                }
            }.navigationTitle("")
                .navigationBarHidden(true)
        }
        //.eraseToAnyView()
    }
    
}

struct LogInScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
