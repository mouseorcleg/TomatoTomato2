//
//  NoTasksView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 24/01/2023.
//

import SwiftUI

struct NoTasksView: View {
    var body: some View {
        ScrollView {
            ZStack {
                Circle()
                    .fill(Color.theme.appBackground)
                    .shadow(radius: 10)

                
                VStack (spacing: 10){
                    Text("There are no tasks yet")
                        .font(.title)
                        .fontWeight(.light)
                    
                    Text("Let's click the add button and start writing down your tasks")
                        .font(.title3)
                        .fontWeight(.light)
                    
                    NavigationLink(destination: AddView(), label: {
                        Text("Add the first task 🎉")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.theme.background)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.theme.accent)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .shadow(radius: 5)
                    })
                }
                .multilineTextAlignment(.center)
                .padding(40)
            }
        } //scrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NoTasksView_Previews: PreviewProvider {
    static var previews: some View {
        NoTasksView()
    }
}
