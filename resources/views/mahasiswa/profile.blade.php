@extends('../layout_mhs.mhs')

@section('title-mhs')
Edit Profile
@endsection
@section('content')
        

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">Edit Profile</h1>

                    <div class="row">

                        <div class="col-lg-6">
                            <!-- Circle Buttons -->
                            <div class="card shadow mb-4">
                            <form action="/updateProfileAct" method="POST">
                                @csrf
                                @method('PUT')
                                <input type="hidden" class="form-control" name="id" id="id" value="{{ Auth::user()->id }}">

                                <div class="col">
                                    <div class="mb-3">
                                    <label>Nim</label>
                                    <input type="text" class="form-control" name="nim" id="nim" placeholder="Masukan Nim" value="{{Auth::user()->nim}}">
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="mb-3">
                                    <label>Nama</label>
                                    <input type="text" class="form-control" name="nama_mhs" id="nama_mhs" placeholder="Masukan Nama Lengkap" value="{{Auth::user()->nama_mhs}}">
                                    </div>
                                </div>

                                 <div class="col">
                                    <div class="mb-3">
                                    <label>Jenis Kelamin</label>
                                    <input type="text" class="form-control" name="jenis_kelamin" id="jenis_kelamin" placeholder="Masukan jenis_kelamin " value="{{Auth::user()->jenis_kelamin}}">
                                    </div>
                                </div>

                                 <div class="col">
                                    <div class="mb-3">
                                    <label>Email</label>
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Masukan Email " value="{{Auth::user()->email}}">
                                    </div>
                                </div>

                                 <div class="col">
                                    <div class="mb-3">
                                    <label>Nomor Telepon</label>
                                    <input type="text" class="form-control" name="no_telp_mhs" id="no_telp_mhs" placeholder="Masukan Nomor Telepon " value="{{Auth::user()->no_telp_mhs}}">
                                    </div>
                                </div>

                                 <div class="col">
                                    <div class="mb-3">
                                    <label>Total Sks</label>
                                    <input type="text" class="form-control" name="sks" id="sks" placeholder="Masukan sks " value="{{Auth::user()->sks}}">
                                    </div>
                                </div>
                            
                                <div class="card-body">
                                    <input type="submit" class="btn btn-success btn-block" value="Edit">  
                                </div>
                            </form>           

                        

                           
                                       
                                        
                                        
                                </div>
                                </div>
                                
                            </div>
                                
                        </div>

                        
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

            

@endsection
