@extends('../layout_dsn.dsn')
@section('title-dsn')
Data Bimbingan
@endsection
@section('content')

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">Daftar Bimbingan</h1>

                    <table class="table table-striped table-hover">
                      <thead>
                                    <tr>
                                      <!-- <th scope="col">ID  </th> -->
                                      <th scope="col">No</th>
                                      <th scope="col">Nim</th>
                                      
                                      

                                    </tr>
                                  </thead>
                                  <tbody>
                                    @foreach($data as $dt)
                                        
                                    <tr>
                                        <td>{{$loop->iteration}}</td>
                                        <td>{{$dt->nim}}</td>
                                      
                                    </tr>
                                         
                                    @endforeach
                                  
                                  
                                  
                                   

                                       
                                  </tbody>
                    </table>
                    
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
@endsection