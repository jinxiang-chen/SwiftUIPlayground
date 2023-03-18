import SwiftUI

struct ImpressViewWithAdapterLayout: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        if verticalSizeClass == .compact {
            HorizontalView()
        } else {
            VerticalView()
        }
    }
}


struct VerticalView: View {
    var body: some View {
        VStack {
            Text("Instant Developer")
                .fontWeight(.bold)
                .font(.system(size: 36))
                .foregroundColor(.white)
            Text("Get help from experts in 15 minutes")
                .fontWeight(.bold)
                .font(.system(size: 16))
                .foregroundColor(.white)
            HStack {
                Image("student")
                Image("tutor")
            }
            Text("Need Help with coding problem? Register!")
                .fontWeight(.bold)
                .font(.system(size: 16))
                .foregroundColor(.white)
            Spacer()
            Button {
            } label: {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 16))
                    
            }.frame(width: 200)
                .padding()
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(10)
            
            Button {
                
            } label: {
                Text("Log In")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 16))
            }.frame(width: 200)
                .padding()
                .background(Color.gray)
                .cornerRadius(10)
        }
        .background {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

        }
    }
}

struct HorizontalView: View {
    var body: some View {
        VStack {
            Text("Instant Developer")
                .fontWeight(.bold)
                .font(.system(size: 36))
                .foregroundColor(.white)
            Text("Get help from experts in 15 minutes")
                .fontWeight(.bold)
                .font(.system(size: 16))
                .foregroundColor(.white)
            HStack {
                Image("student")
                Image("tutor")
            }
            Text("Need Help with coding problem? Register!")
                .fontWeight(.bold)
                .font(.system(size: 16))
                .foregroundColor(.white)
            Spacer()
            HStack {
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        
                }.frame(width: 200)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.indigo)
                .cornerRadius(10)
                Button {
                    
                } label: {
                    Text("Log In")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                }.frame(width: 200)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
        .ignoresSafeArea()
    }
}
                                  
struct ImpressViewWithAdapterLayout_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ImpressViewWithAdapterLayout()
                .previewDevice(PreviewDevice(rawValue: "iphone 14 Pro"))
                .previewDisplayName("iPhone 14 Pro")
            ImpressViewWithAdapterLayout()
                .previewDevice(PreviewDevice(rawValue: "iphone 14 Pro"))
                .previewDisplayName("iPhone 14 Pro Landscapte")
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
