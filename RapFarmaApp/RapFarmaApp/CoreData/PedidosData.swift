//
//  PedidosData.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 01/11/21.
//

import Foundation
import CoreData

class PedidosData{
    static let shared:PedidosData = PedidosData()
    
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
    func getOrder() -> [Pedidos] {
        let fr = NSFetchRequest<Pedidos>(entityName: "Pedidos")
        do {
            return try self.persistentContainer.viewContext.fetch(fr)
        }catch {
            print(error)
        }
        
        return []
    }
    
    func addOrder(nome: String, status: Int32,farma:String) {
        let pedido = Pedidos(context: self.persistentContainer.viewContext)
        pedido.nome = nome
        pedido.status = status
        pedido.farma = farma
        
        let pedidos = getOrder()
        if pedidos.count > 1 {
            pedidos[pedidos.count-1].status = 0
        }
        self.saveContext()
    }
    func deleta(item: Pedidos) throws{
        self.persistentContainer.viewContext.delete(item)
        self.saveContext()
    }

}
