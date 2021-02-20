//
//  ViewController.swift
//  Oroshify
//
//  Created by Tomonari Ishida on 2021/02/20.
//

import UIKit
import Amplify
import AmplifyPlugins
import Combine

class ViewController: UIViewController {
    
    
    var todoSubscription: AnyCancellable?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performOnAppear()
    }
    
    
    func performOnAppear() {
        subscribeTodos()
    }
    
    func subscribeTodos() {
        self.todoSubscription
            = Amplify.DataStore.publisher(for: Todo.self)
            .sink(receiveCompletion: { completion in
                print("Subscription has been completed: \(completion)")
            }, receiveValue: { mutationEvent in
                print("Subscription got this value: \(mutationEvent)")
                
                do {
                    let todo = try mutationEvent.decodeModel(as: Todo.self)
                    
                    switch mutationEvent.mutationType {
                    case "create":
                        print("Created: \(todo)")
                    case "update":
                        print("Updated: \(todo)")
                    case "delete":
                        print("Deleted: \(todo)")
                    default:
                        break
                    }
                    
                } catch {
                    print("Model could not be decoded: \(error)")
                }
            })
    }
    
}

