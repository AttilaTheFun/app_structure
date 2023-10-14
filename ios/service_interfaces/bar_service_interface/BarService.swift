
public protocol BarService {
    func bar()   
}

public protocol BarServiceProvider {
    var barService: BarService { get }
}