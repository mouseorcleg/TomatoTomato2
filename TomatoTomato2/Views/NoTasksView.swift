//
//  NoTasksView.swift
//  TomatoTomato2
//
//  Created by Maria Kharybina on 24/01/2023.
//

import SwiftUI

struct NoTasksView: View {
    
    @State var animate: Bool = false
    
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
                        Text("Add a shiny new task 🎉")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.theme.background)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.theme.accent)
                            .cornerRadius(10)
                            .padding(.top)
                            .padding(.horizontal, 40)
                            .shadow(
                                color: animate ? Color.white.opacity(70) : Color.theme.accent.opacity(70),
                                radius: 15
                            )
                    })
                }
                .multilineTextAlignment(.center)
                .padding(40)
            }
            .padding(.top, 60)
        } //scrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoTasksView_Previews: PreviewProvider {
    static var previews: some View {
        NoTasksView()
    }
}
