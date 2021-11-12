//
//  AddUserView.swift
//  koala
//
//  Created by 정태훈 on 2021/10/18.
//

import SwiftUI

struct AddUserView: View {
    enum Field: Hashable {
        case id, password, validPassword, email, nickname
    }
    @EnvironmentObject var viewModel: SignUpViewModel
    @State var id: String = ""
    @State var password: String = ""
    @State var validPassword: String = ""
    @State var email: String = ""
    @State var nickname: String = ""
    @State var isPersist: Bool = true
    @FocusState var focusField: Field?
    
    func checkValidate() -> Bool {
        return false
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("회원정보 입력")
                .font(.custom("NotoSansKR-Medium", size: 16))
                .foregroundColor(Color("PrimaryBlack"))
                .padding(.bottom, 8)
            
            Text("사용할 회원 정보를 입력해주세요.")
                .font(.custom("NotoSansKR-Regular", size: 12))
                .foregroundColor(Color("DeactivateColor"))
                .padding(.bottom, 27)
            
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
            .padding(.bottom, 24)
            
            HStack {
                SecureField("", text: self.$password)
                    .font(.custom("NotoSansKR-Regular", size: 14))
                    .foregroundColor(Color("PrimaryBlack"))
                    .autocapitalization(.none)
                    .focused($focusField, equals: .password)
                    .submitLabel(.next)
                    .placeholder(when: self.password.isEmpty) {
                        Text("비밀번호 (영문, 숫자, 특수기호 포함 8자~15자)")
                            .font(.custom("NotoSansKR-Regular", size: 14))
                            .foregroundColor(Color("DeactivateColor"))
                    }
                    .padding(EdgeInsets(top: 14, leading: 16, bottom: 13, trailing: 16))
            }.border(focusField != nil && focusField == .password ? Color("PrimaryBlack") : Color("DisableColor"))
                .animation(.easeInOut)
                .padding(.bottom, 24)
            
            HStack {
                SecureField("", text: self.$validPassword)
                    .font(.custom("NotoSansKR-Regular", size: 14))
                    .foregroundColor(Color("PrimaryBlack"))
                    .autocapitalization(.none)
                    .focused($focusField, equals: .validPassword)
                    .submitLabel(.next)
                    .placeholder(when: self.validPassword.isEmpty) {
                        Text("비밀번호 확인")
                            .font(.custom("NotoSansKR-Regular", size: 14))
                            .foregroundColor(Color("DeactivateColor"))
                    }
                    .padding(EdgeInsets(top: 14, leading: 16, bottom: 13, trailing: 16))
            }.border(focusField != nil && focusField == .validPassword ? Color("PrimaryBlack") : Color("DisableColor"))
                .animation(.easeInOut)
                .padding(.bottom, 24)
            
            HStack {
                TextField("", text: self.$email)
                    .font(.custom("NotoSansKR-Regular", size: 14))
                    .foregroundColor(Color("PrimaryBlack"))
                    .autocapitalization(.none)
                    .focused($focusField, equals: .email)
                    .submitLabel(.next)
                    .placeholder(when: self.email.isEmpty) {
                        Text("이메일")
                            .font(.custom("NotoSansKR-Regular", size: 14))
                            .foregroundColor(Color("DeactivateColor"))
                    }
                    .padding(EdgeInsets(top: 14, leading: 16, bottom: 13, trailing: 16))
            }
            .border(focusField != nil && focusField == .email ? Color("PrimaryBlack") : Color("DisableColor"))
            .animation(.easeInOut)
            .padding(.bottom, 24)
            
            HStack {
                TextField("", text: self.$nickname)
                    .font(.custom("NotoSansKR-Regular", size: 14))
                    .foregroundColor(Color("PrimaryBlack"))
                    .autocapitalization(.none)
                    .focused($focusField, equals: .nickname)
                    .submitLabel(.done)
                    .placeholder(when: self.nickname.isEmpty) {
                        Text("닉네임")
                            .font(.custom("NotoSansKR-Regular", size: 14))
                            .foregroundColor(Color("DeactivateColor"))
                    }
                    .padding(EdgeInsets(top: 14, leading: 16, bottom: 13, trailing: 16))
            }
            .border(focusField != nil && focusField == .nickname ? Color("PrimaryBlack") : Color("DisableColor"))
            .animation(.easeInOut)
            .padding(.bottom, 24)
            
            
            Spacer()
        }
        .padding(EdgeInsets(top: 24, leading: 0, bottom: 24, trailing: 0))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onSubmit {
            switch focusField {
            case .id:
                focusField = .password
            case .password:
                focusField = .validPassword
            case .validPassword:
                focusField = .email
            case .email:
                focusField = .nickname
            case .nickname:
                break
            case .none:
                focusField = .id
            }
        }
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
            .padding(.horizontal, 16)
    }
}
