import UIKit

class Context {
    private var strategy: Strategy
    
    init(_ strategy: Strategy) {
        self.strategy = strategy
    }
    
    func update(_ strategy: Strategy) {
        self.strategy = strategy
    }
    
    func someBussinessLogic() {
        let array = [1,2,9,6,3,7,4,7]
        print(strategy.customSort(array))
    }
}

protocol Strategy {
    func customSort<T: Comparable>(_ data: [T]) -> [T]
}

class StrategyA: Strategy {
    func customSort<T>(_ data: [T]) -> [T] where T : Comparable {
        return data.sorted()
    }
}

class StrategyB: Strategy {
    func customSort<T>(_ data: [T]) -> [T] where T : Comparable {
        return data.sorted(by: >)
    }
}

class StrategyС: Strategy {
    func customSort<T>(_ data: [T]) -> [T] where T : Comparable {
        return data.sorted(by: <)
    }
}

let context = Context(StrategyA())
context.someBussinessLogic()
context.update(StrategyB())
context.someBussinessLogic()
