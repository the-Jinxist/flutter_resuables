class Resource<T>{

  Resource(this.ops, this.modelResponse, this.networkError);

  Resource.loading(): ops = NetworkStatus.LOADING, modelResponse = null, networkError = "";

  Resource.idle(): ops = NetworkStatus.IDLE, modelResponse = null, networkError = "";

  Resource.success(this.modelResponse): ops = NetworkStatus.SUCCESSFUL, networkError = "";
  
  Resource.failed(this.networkError): ops = NetworkStatus.SUCCESSFUL, modelResponse = null;

  final NetworkStatus ops;
  final T modelResponse;
  final String networkError;


}

enum NetworkStatus {
  IDLE, LOADING, SUCCESSFUL, FAILED
}