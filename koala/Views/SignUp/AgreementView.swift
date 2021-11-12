//
//  AgreementView.swift
//  koala
//
//  Created by 정태훈 on 2021/10/18.
//

import SwiftUI

struct AgreementView: View {
    @EnvironmentObject var viewModel: SignUpViewModel
    @State var openPrivacy: Bool = false
    @State var openKoala: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("약관 동의")
                .font(.custom("NotoSansKR-Medium", size: 16))
                .foregroundColor(Color("PrimaryBlack"))
                .padding(.bottom, 8)
            
            Text("원활한 사용을 위하여 필수 약관 동의가 필요합니다.")
                .font(.custom("NotoSansKR-Regular", size: 12))
                .foregroundColor(Color("DeactivateColor"))
                .padding(.bottom, 27)
            
            HStack(spacing: 0){
                Toggle(isOn: self.$viewModel.allChecked) {
                    
                }
                .toggleStyle(RoundCheckBoxStyle())
                .padding(.trailing, 16)
                
                Text("약관 전체동의")
                    .font(.custom("NotoSansKR-Regular", size: 14))
                    .foregroundColor(Color("PrimaryBlack"))
                
                Spacer()
                
            }.padding(.bottom, 15.5)
            
            Divider()
                .padding(.bottom, 15.5)
            
            withAnimation(.easeInOut(duration: 0.2)){
                VStack(alignment: .leading, spacing: 0){
                    HStack(spacing: 0){
                        Toggle(isOn: self.$viewModel.privacyChecked) {
                            
                        }
                        .toggleStyle(RoundCheckBoxStyle())
                        .padding(.trailing, 16)
                        
                        Text("개인정보 이용약관 (필수)")
                            .font(.custom("NotoSansKR-Regular", size: 14))
                            .foregroundColor(Color("PrimaryBlack"))
                        
                        Spacer()
                        Button(action: {
                            openPrivacy.toggle()
                        }) {
                            Image(systemName: openPrivacy ? "chevron.down":"chevron.right")
                                .foregroundColor(Color("DeactivateIndicatorColor"))
                        }
                    }
                    if(openPrivacy) {
                        VStack{
                            Text("aaa")
                                .padding(16)
                        }
                        .frame(maxWidth: .infinity)
                        .border(Color("DisableColor"))
                        .padding(.top, 32)
                    }
                }.padding(.bottom, 24)
            }
            
            withAnimation(.easeInOut(duration: 0.2)){
                VStack(alignment: .leading, spacing: 0){
                    HStack(spacing: 0){
                        Toggle(isOn: self.$viewModel.koalaChecked) {
                            
                        }
                        .toggleStyle(RoundCheckBoxStyle())
                        .padding(.trailing, 16)
                        
                        Text("koala 이용약관 (필수)")
                            .font(.custom("NotoSansKR-Regular", size: 14))
                            .foregroundColor(Color("PrimaryBlack"))
                        
                        Spacer()
                        Button(action: {
                            openKoala.toggle()
                        }) {
                            Image(systemName: openKoala ? "chevron.down":
                                    "chevron.right")
                                .foregroundColor(Color("DeactivateIndicatorColor"))
                        }
                    }
                    if(openKoala) {
                        VStack{
                            Text("aaa")
                                .padding(16)
                        }
                        .frame(maxWidth: .infinity)
                        .border(Color("DisableColor"))
                        .padding(.top, 32)
                    }
                }.padding(.bottom, 24)
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 24, leading: 0, bottom: 24, trailing: 0))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AgreementView_Previews: PreviewProvider {
    static var previews: some View {
        AgreementView()
    }
}
