    //
//  NewRestaurantView.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/5/17.
//

import SwiftUI

struct NewRestaurantView: View {

    @State private var restaurantImage: UIImage?
    @State private var showPhotoOptions = false
    @State private var photoSource: PhotoSource?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding([.leading, .trailing], 50)
                    .padding([.top, .bottom], 20)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    .padding(.horizontal)
                    .onTapGesture {
                        self.showPhotoOptions.toggle()
                    }
                VStack {
                    FormTextField(
                        label: "NAME",
                        placeHolder: "Fill in the restaurant name",
                        value: .constant("")
                    )
                    FormTextField(
                        label: "TYPE",
                        placeHolder: "Fill in the restaurant type",
                        value: .constant("")
                    )
                    FormTextField(
                        label: "ADDRESS",
                        placeHolder: "Fill in the restaurant address",
                        value: .constant("")
                    )
                    FormTextField(
                        label: "PHONE",
                        placeHolder: "Fill in the restaurant phone",
                        value: .constant("")
                    )
                    FormTextField(
                        label: "DESCRIPTION",
                        placeHolder: "Fill in the restaurant description",
                        value: .constant("")
                    )
                }
                .padding()
            }
            .navigationTitle("New Restaurant")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .accentColor(.primary)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(Color("NavigationBarTitle"))
                    }
                }
            }
        }
        .actionSheet(isPresented: $showPhotoOptions){
            ActionSheet(
                title: Text("Choose your photo source"),
                message: nil,
                buttons: [
                    .default(Text("Camera")) {
                        self.photoSource = .camera
                    },
                    .default(Text("Photo Library")) {
                        self.photoSource = .photoLibrary
                    },
                    .cancel()
                ]
            )
        }
        .fullScreenCover(item: $photoSource) { source in
            switch source {
            case .photoLibrary: ImagePicker(
                sourceType: .photoLibrary,
                selectedImage: $restaurantImage)
            .ignoresSafeArea()
            case .camera: ImagePicker(
                sourceType: .camera,
                selectedImage: $restaurantImage)
            .ignoresSafeArea()
            }
        }
    }
}

struct NewRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NewRestaurantView()
    }
}
