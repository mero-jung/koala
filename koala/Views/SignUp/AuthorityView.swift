//
//  AuthorityView.swift
//  koala
//
//  Created by 정태훈 on 2021/10/18.
//

import SwiftUI

struct AuthorityView: View {
    @EnvironmentObject var viewModel: SignUpViewModel
    var images: [String] = ["Bell", "Camera", "Folder"]
    var titles: [String] = ["알림 (필수)", "카메라 (선택)", "저장공간 (선택)"]
    var contents: [String] = ["키워드 알림시 필수 이용", "채팅방 이미지 전송시 이용", "채팅방 이미지 저장/업로드"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("권한 허용")
                .font(.custom("NotoSansKR-Medium", size: 16))
                .foregroundColor(Color("PrimaryBlack"))
                .padding(.bottom, 8)
            
            Text("원활한 서비스 사용을 위하여 권한 허용이 필요합니다.")
                .font(.custom("NotoSansKR-Regular", size: 12))
                .foregroundColor(Color("DeactivateColor"))
                .padding(.bottom, 27)
            
            VStack(alignment: .leading, spacing: 24){
                ForEach(Array(images.enumerated()), id:\.offset) { (index, imageName) in
                    HStack(spacing: 0){
                        Image(imageName)
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 24)
                        VStack(alignment: .leading, spacing: 2){
                            Text(titles[index])
                                .font(.custom("NotoSansKR-Regular", size: 12))
                                .foregroundColor(Color("PrimaryBlack"))
                            Text(contents[index])
                                .font(.custom("NotoSansKR-Regular", size: 11))
                                .foregroundColor(Color("DeactivateColor"))
                        }
                    }.padding(.leading, 8)
                }
            }.padding(.bottom, 24)
            
            Divider()
                .padding(.bottom, 24)
            
            HStack(alignment: .top, spacing: 0){
                Image("AlertCircle")
                    .frame(width: 16, height: 16)
                    .padding(.trailing, 8)
                
                Text("""
필수 권한을 허용하지 않는 경우,  정상적인 서비스 사용이 어려울 수 있습니다.
선택 권한을 허용하지 않아도 해당 기능 외 서비스는 정상적으로 사용가능합니다.
‘설정 > 애플리케이션 > koala > 권한’에서 재설정이 가능합니다.
""")
                    .lineLimit(nil)
                    .font(.custom("NotoSansKR-Regular", size: 11))
                    .foregroundColor(Color("DeactivateColor"))
            }
            
            
            Spacer()
        }
        .padding(EdgeInsets(top: 24, leading: 0, bottom: 24, trailing: 0))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AuthorityView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorityView()
            .padding(.horizontal, 16)
    }
}
