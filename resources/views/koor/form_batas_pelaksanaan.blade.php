@extends('../layout_koor.koor')
@section('title-koor')
Tambah Batas Pelaksanaan
@endsection
@section('content')

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                   

                    <div class="row">
                      <div class="col-lg-6">
                        <div class="card-body">
                           <h1 class="h3 mb-4 text-gray-800">Tambah Batas Pelaksanaan</h1>
                           

                           
                           <form method="POST" action="/koor/tambah/batas/pelaksaan/kp/act">
                            @csrf
                              
                            <div class="form-group">
                              <label for="exampleInputPassword1">Tanggal Mulai Pelaksanaan KP</label>
                              <input type="date" class="form-control" name="mulai" >
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Tanggal Batas Pelaksanaan KP</label>
                              <input type="date" class="form-control" name="batas" >
                            </div>
  
                              <button type="submit" class="btn btn-primary">Tambah</button>
                           </form>
                         
                           

                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="card-body">
                           <h1 class="h3 mb-4 text-gray-800">Data Pelaksanaan</h1>
                           <table class="table table-striped table-hover" style="margin-top: 10px">
                                  <thead>
                                    <tr>
                                      <!-- <th scope="col">ID  </th> -->
                                      <th scope="col">No</th>
                                      <th scope="col">Mulai</th>
                                      <th scope="col">Batas</th>
                                      

                                    </tr>
                                  </thead>
                                  <tbody>
                                    @foreach($data as $p)
                                    <tr>
                                      <td>{{$loop->iteration}}</td>
                                      <td>{{$p->mulai}}</td>
                                      <td>{{$p->batas}}</td>
                                    </tr>
                                    @endforeach
                                                            
                                  </tbody>
                            </table>
                           
                        </div>
                      </div>
                      

                    </div>

                   
                    
                </div>
                <!-- /.container-fluid -->
                
            </div>
            <!-- End of Main Content -->
@endsection