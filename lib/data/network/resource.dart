class Resource<T>{

  const Resource(this.ops, this.modelResponse, this.networkError);

  final NetworkStatus ops;
  final T modelResponse;
  final String networkError;

}

enum NetworkStatus {
  IDLE, LOADING, SUCCESSFUL, FAILED
}