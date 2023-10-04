//
//  S1.swift
//  final
//
//  Created by Jairo Aguilar on 3/3/23.
//

import SwiftUI

struct Account: View {
    
    @State private var fristName = ""
    @State private var lastName = ""
    @State private var brithdate = Date()
    @State private var email = ""
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Frist name", text: $fristName)
                    TextField("Last name", text: $lastName)
                    TextField("Email", text: $email)
                    TextField("Home Address", text:$email)
                }
                
                Section(header: Text("Actions")){
                    
                    Link("Terms of Service", destination: URL(string: "https://sites.google.com/view/terms-of-service-jav37")!)
                    Link("Link to your Duke Engery Account", destination: URL(string: "https://duke-energy.com/home")!)
                    
                }
                
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
                        
                    } label: {
                      
                    }
                    Button("Save",action: saveUser)
                }
            }
        }
        .accentColor(.blue)
    }

    struct S1_Previews: PreviewProvider {
        static var previews: some View {
            Account()
        }
    }
        func saveUser(){
            print("User Saved")
        }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil , from: nil, for: nil)
    }
}
#endif
