@extends('../layout_koor.koor')
@section('title-koor')
Set Ajaran
@endsection
@section('content')

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">Set Ajaran</h1>
                    <div class="card-body">
                    <h5 class="h3 mb-4 text-gray-800">Data ajaran digunakan</h5>
                    <table class="table table-striped table-hover">
                      <thead>
                                    <tr>
                                      <!-- <th scope="col">ID  </th> -->
                                      
                                      <th scope="col">Semester</th>
                                      <th scope="col">Tahun</th>
                                      

                                    </tr>
                                  </thead>
                                  <tbody>
                                  @foreach($dajaran as $da)
                                  <tr>
                                    
                                    <td>{{$da->semester}}</td>
                                    <td>{{$da->tahun}}</td>
                                   
                                  @endforeach
                                  
                                  
                                   

                                       
                                  </tbody>
                    </table>
                    
                                    <form action="/koor/edit/set/ajaran" method="POST">
                                        @csrf
                                        @method('PUT')
                                        <div class="col">
                                            <div class="mb-3">
                                            <label>Semester</label>
                                            <input type="text" class="form-control" name="semester" id="semester" placeholder="Masukan Semester">
                                            </div>
                                        </div>

                                        <div class="col">
                                            <div class="mb-3">
                                            <label>Tahun</label>
                                            <input type="text" class="form-control" name="tahun" id="tahun" placeholder="Masukan Tahun">
                                            </div>
                                        </div>

                                        
                                        
                                        <div class="card-body">
                                            <input type="submit" class="btn btn-success btn-block" value="Update">  
                                        </div>
                                </div>
                                    </form>
                    
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
@endsection