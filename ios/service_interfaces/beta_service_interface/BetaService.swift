
public protocol BetaService {
    func beta()   
}

public protocol BetaServiceProvider {
    var betaService: BetaService { get }
}