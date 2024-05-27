//
//  ContentView.swift
//  SwiftUI_P2
//
//  Created by Irinka Datoshvili on 24.05.24.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = tasksList
    
    var body: some View {
        VStack {
            HeaderView(remainingTasks: tasks.filter { !$0.isCompleted }.count)
            
            Button(action: {
                completeAllTasks()
            }) {
                Text("Complete All")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(.white)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(red: 0.451, green: 0.671, blue: 1.0), Color(red: 0.275, green: 0.753, blue: 0.761)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 18)
            .padding(.top, 15)
            
            // MARK: - ScrollView
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    // MARK: - Progress Section
                    
                    Text("Progress")
                        .font(.system(size: 22))
                        .padding(.leading, 20)
                        .padding(.top, 10)
                    
                    
                    ProgressView(
                        progress: CGFloat(tasks.filter { $0.isCompleted }.count) / CGFloat(tasks.count),
                        completedTasks: tasks.filter { $0.isCompleted }.count,
                        totalTasks: tasks.count
                    )
                    .padding(.bottom, 20)
                }
                
                // MARK: - LazyVStack
                
                LazyVStack(spacing: 10) {
                    Section(header: Text("Completed Tasks")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 22))) {
                            ForEach(tasks) { task in
                                TaskRow(task: task, toggleCompletion: toggleTaskCompletion)
                            }
                        }
                }
                .padding(.horizontal, 20)
            }
        }
        .background(Color("Background"))
    }
    
    // MARK: - Helper Functions
    
    func completeAllTasks() {
        for i in 0..<tasks.count {
            tasks[i].isCompleted = true
        }
    }
    
    func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            tasks.sort { $0.isCompleted && !$1.isCompleted }
        }
    }
}

// MARK: - Header View

struct HeaderView: View {
    let remainingTasks: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("You have \(remainingTasks) tasks to complete")
                    .fontWeight(.semibold)
                    .font(.system(size: 25))
                    .lineLimit(2)
            }
            Spacer()
            
            profile
        }
        .padding(.horizontal, 20)
        .padding(.top, 24)
    }
    
    var profile: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 186/255, green: 131/255, blue: 222/255), .clear]), startPoint: .top, endPoint: .bottom))
                .frame(width: 46, height: 46)
                .overlay(
                    Image("profile")
                        .resizable()
                        .frame(width: 42, height: 42)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .fill(Color("DarkOrange"))
                                .frame(width: 15, height: 15)
                                .overlay(
                                    Text("\(remainingTasks)")
                                        .padding(5)
                                        .font(.system(size: 9))
                                        .foregroundColor(.white)
                                )
                            , alignment: .bottomTrailing))
        }
    }
}

// MARK: - ProgressBar View

struct ProgressView: View {
    let progress: CGFloat
    let completedTasks: Int
    let totalTasks: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Daily Task")
                .font(.system(size: 18))
            
            Text("\(completedTasks)/\(totalTasks) Task Completed")
                .font(.system(size: 16))
            
            HStack {
                Text("Keep working")
                    .foregroundColor(.secondary)
                    .font(.system(size: 14))
                
                Spacer()
                
                Text("\(Int(progress * 100))%")
                    .font(.system(size: 18))
            }
            
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width - 80, height: 18)
                    .opacity(0.3)
                    .foregroundColor(Color("ProgressColor2"))
                
                Rectangle()
                    .frame(width: progress * (UIScreen.main.bounds.width - 80), height: 18)
                    .foregroundColor(Color("ProgressColor"))
                    .cornerRadius(8)
            }
            .cornerRadius(8)
            .frame(height: 18)
            
        }
        .padding()
        .frame(height: 139)
        .background(Color("AdaptiveBackground"))
        .cornerRadius(8)
        .padding(.horizontal, 20)
        
    }
}

// MARK: - Task View

struct TaskRow: View {
    var task: Task
    let toggleCompletion: (Task) -> Void
    
    private func rectangleColor(forIndex index: Int) -> Color {
        let colors: [Color] = [Color("CustomOrange"), Color("CustomBlue"), Color("CustomPink")]
        let colorIndex = index % colors.count
        return colors[colorIndex]
    }
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 15)
                .foregroundColor(rectangleColor(forIndex: tasksList.firstIndex(where: { $0.id == task.id }) ?? 0))
            VStack(alignment: .leading) {
                Text(task.title)
                
                HStack {
                    Image("calendar")
                    Text(task.date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(10)
            
            Spacer()
            
            Button(action: {
                toggleCompletion(task)
            }) {
                Image(task.isCompleted ? "CircleFill" : "Circle")
            }
            .padding(.trailing, 11)
        }
        .frame(height: 80)
        .background(Color("AdaptiveBackground"))
        .cornerRadius(8)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
