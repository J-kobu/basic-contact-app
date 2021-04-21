//
//  ContentView.swift
//  Shared
//
//  Created by Jacob Aguilar on 21-04-21.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedContact: Contact?
    
    var body: some View {
        NavigationView {
            List (ContactFactory.contacts) { contact in
                ZStack {
                    ContactImageRow(contact: contact)
                        .onTapGesture {
                            self.selectedContact = contact
                        }
                }
                .sheet(item: self.$selectedContact) { contact in
                    ContactDetailView(contact: contact)
                }
            }
            .navigationBarTitle("Contactos", displayMode: .large)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContactImageRow: View {
    var contact: Contact
    
    var body: some View {
        HStack {
            Image(contact.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(30)
            
            Text(contact.name)
                .font(.system(size: 20, design: .rounded))
                .frame(width: 300, alignment: .leading)
                .padding()
            
                
        }
        .frame(alignment: .leading)
    }
}
