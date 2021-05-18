@extends('../layout_mhs.mhs')

@section('title-mhs')
Pengajuan KP
@endsection
@section('content')
        

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">PENGAJUAN KP</h1>

                    <div class="row">

                        <div class="col-lg-6">
                            <!-- Circle Buttons -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Tambah Pengajuan KP</h6>
                                </div>
                                <div class="card-body">
                                    <form action="/mhs/tambah/kp" method="POST" enctype="multipart/form-data">
                                @csrf
                                <div class="col">
                                            <div class="mb-3">
                                            <label>Semester</label>
                                            <input type="text" class="form-control" name="semester" id="semester" placeholder="Masukan Tahun" value="Genap" readonly>
                                            </div>
                                        </div>

                                        <div class="col">
                                            <div class="mb-3">
                                            <label>Tahun</label>
                                            <input type="text" class="form-control" name="tahun" placeholder="Masukan Tahun" value="2020/2021" readonly>
                                            </div>
                                        </div>

                                        

                                        <div class="col">
                                            <div class="mb-3">
                                            <label>Nim</label>
                                            <input type="text" class="form-control" name="nim" placeholder="Masukan Nim" required="required" value="{{ Auth::user()->nim }}" readonly>
                                            </div>
                                        </div>

                                        <div class="col">
                                        <div class="mb-3">
                                        <label>Nik</label>
                                        <input type="text" class="form-control" name="nik" placeholder="Masukan Nik" required="required">
                                        </div>
                                        </div>

                                        <div class="col">
                                        <div class="mb-3">
                                        <label>Judul KP</label>
                                        <input type="text" class="form-control" name="judul" placeholder="Masukan Judul Kp" required="required">
                                        </div>
                                        </div>

                                        <div class="col">
                                        <div class="mb-3">
                                        <label>Tools</label>
                                        <input type="text" class="form-control" name="tools" placeholder="Masukan Tools" required="required">
                                        </div>
                                        </div>

                                        <div class="col">
                                        <div class="mb-3">
                                        <label>Spesifikasi</label>
                                        <input type="text" class="form-control" name="spesifikasi" placeholder="Masukan Spesifikasi" required="required">
                                        </div>
                                        </div>

                                        <div class="col">
                                        <div class="mb-3">
                                        <label>Penguji</label>
                                        <input type="text" class="form-control" name="penguji" placeholder="Masukan penguji" required="required">
                                        </div>
                                        </div>

                                        <div class="col">
                                        <div class="mb-3">
                                        <label>Ruang</label>
                                        <input type="text" class="form-control" name="ruang" placeholder="Masukan Ruang" required="required">
                                        </div>
                                        </div>

                                        <div class="col">
                                        <div class="mb-3">
                                        <label>Lembaga</label>
                                        <input type="text" class="form-control" name="lembaga" placeholder="Masukan Lembaga" required="required">
                                        </div>
                                        </div>

                                        <div class="col">
                                        <div class="mb-3">
                                        <label>Pimpinan</label>
                                        <input type="text" class="form-control" name="pimpinan" placeholder="Masukan Pimpinan" required="required">
                                        </div>
                                        </div>

                                        <div class="col">
                                        <div class="mb-3">
                                        <label>No Telepon</label>
                                        <input type="text" class="form-control" name="no_telp" placeholder="Masukan Telepon" required="required">
                                        </div>
                                        </div>

                                        <div class="col">
                                        <div class="mb-3">
                                        <label>Alamat</label>
                                        <textarea class="form-control" name="alamat" placeholder="Masukan Alamat" required="required"></textarea>
                                        </div>
                                        </div>

                                        <div class="col">
                                        <div class="mb-3">
                                        <label>Dokumen</label> </br>
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" name="dokumen">
                                            <label class="custom-file-label" for="customFile">Pilih file</label>
                                        </div>
                                        </div>
                                        
                                         <div class="card-body">
                                            <input type="submit" class="btn btn-success btn-block" value="Tambah">  
                                        </div>
                                </div>
                                </div>
                                
                            </div>
                                    </form>
                                    

                                        

                                     
                                        
                                
                        </div>

                         <div class="col-lg-6">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Daftar Pengajuan Pra KP  </h6>
                                </div>

                                <table class="table table-hover">
                                  <thead>
                                    <tr>
                                      <!-- <th scope="col">ID  </th> -->
                                      <th scope="col">No</th>
                                      <th scope="col">Lembaga</th>
                                      <th scope="col">Tanggal Ujian</th>
                                      <th scope="col">Status</th>
                                      
                                    </tr>
                                  </thead>
                                  <tbody>
                                   @foreach($datapra as $dpra)
                                      <tr>
                                        <td>{{$loop->iteration}}</td>
                                        <td>{{$dpra->lembaga}}</td>
                                        <td>Proses</td>
                                        <td>Proses</td>
                                      </tr>
                                    @endforeach
                                   

                                       
                                  </tbody>
                                </table>
                            </div>

                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Daftar Pengajuan  KP  </h6>
                                </div>

                                <table class="table table-hover">
                                  <thead>
                                    <tr>
                                      <!-- <th scope="col">ID  </th> -->
                                      <th scope="col">No</th>
                                      <th scope="col">Judul</th>
                                      <th scope="col">Pembimbing</th>
                                      <th scope="col">Tanggal Ujian</th>
                                      <th scope="col">Status</th>
                                      
                                    </tr>
                                  </thead>
                                  <tbody>
                                    @foreach($datakp as $dkp)
                                      <tr>
                                        <td>{{$loop->iteration}}</td>
                                        <td>{{$dkp->judul}}</td>
                                        <td>{{$dkp->penguji}}</td>
                                        <td>Proses</td>
                                        <td>Proses</td>
                                      </tr>
                                    @endforeach
                                   

                                       
                                  </tbody>
                                </table>
                            </div>
                        </div>



                        <!-- <div class="col-lg-6">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Data Pengajuan KP</h6>
                                </div>
                                <div class="card-body">
                                <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2" style="width:480%">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Semester: </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">Judul: </div>
                                            <div class="my-2"></div>
                                            <a href="#" class="btn btn-success btn-icon-split">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-check"></i>
                                                </span>
                                                <span class="text">Disetujui</span>
                                            </a>
                                            <a href="#" class="btn btn-danger btn-icon-split">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-exclamation-triangle"></i>
                                                </span>
                                                <span class="text">Ditolak</span>
                                            </a>
                                            <a href="#" class="btn btn-warning btn-icon-split">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-info"></i>
                                                </span>
                                                <span class="text">Belum Diverifikasi</span>
                                            </a>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

            

@endsection
