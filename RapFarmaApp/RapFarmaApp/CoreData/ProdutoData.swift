//
//  ProdutoData.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 12/10/21.
//

import Foundation
import CoreData

class ProdutosData{
    static let shared:ProdutosData = ProdutosData()
    
    var contenxt: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    // MARK: - Core Data stack
    ///var privada ja que nao vai ser acessada
    private lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "RapFarmaApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // Buscar todas as reuniões no banco de dados
    func getProducts() -> [Produto] {
        let fr = NSFetchRequest<Produto>(entityName: "Produto")
        do {
            return try self.persistentContainer.viewContext.fetch(fr)
        }catch {
            print(error)
        }
        
        return []
    }
    
    func addProducts(produto: Produto) {
        let prod = Produto(context: self.persistentContainer.viewContext)

        self.saveContext()
    }
    
    func deleta(item: Produto) throws{
        self.persistentContainer.viewContext.delete(item)
        self.saveContext()
    }

}
