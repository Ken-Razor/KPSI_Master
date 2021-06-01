@extends('../layout_koor.koor')
@section('title-koor')
Penjadwalan Ujian
@endsection
@section('content')

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">Atur Jadwal Ujian</h1>
                    <div class="card-body">
                  <div class="col-lg-6">
                    
                                    <form action="/koor/atur/jadwal/ujian/simpan/{id}" method="POST">
                                        @csrf
                                        
                                        @foreach ($data as $d)
                                        <div class="col">
                                            <div class="mb-3">
                                            <label>Nim</label>
                                            <input type="text" class="form-control" name="nim" id="nim" value="{{$d->nim}}" readonly>
                                            </div>
                                        </div>
                                        @endforeach
                                        
                                        <div class="col">
                                            <div class="mb-3">
                                        <div class="form-group">
                                          <label >Dosen Pembimbing</label>
                                          <select class="form-control" name="dosbing" >
                                            @foreach($ddosen as $ds)
                                            <option value="{{$ds->nama_dosen}}">{{$ds->nama_dosen}}</option>
                                            @endforeach
                                          
                                          </select>
                                        </div>
                                      </div>
                                    </div>

                                     <div class="col">
                                            <div class="mb-3">
                                        <div class="form-group">
                                          <label >Dosen Penguji</label>
                                          <select class="form-control" name="dosuji" >
                                            @foreach($ddosen as $ds)
                                            <option value="{{$ds->nama_dosen}}">{{$ds->nama_dosen}}</option>
                                            @endforeach
                                          
                                          </select>
                                        </div>
                                      </div>
                                    </div>

                                     <div class="col">
                                            <div class="mb-3">
                                            <label>Tanggal</label>
                                            <input type="date" class="form-control" name="tanggal" id="tanggal">
                                            </div>
                                      </div>

                                        <div class="col">
                                            <div class="mb-3">
                                            <label>Jam</label>
                                            <input type="time" class="form-control" name="jam" id="jam">
                                            </div>
                                      </div>

                                      <div class="col">
                                            <div class="mb-3">
                                            <label>Ruangan</label>
                                            <input type="text" class="form-control" name="ruangan" id="ruangan" required>
                                            </div>
                                        </div>
                                   
                                     

                                        <div class="card-body">
                                            <input type="submit" class="btn btn-success btn-block" value="Simpan">  
                                        </div>
                                </div>
                                    </form>
                                  </div>


                    
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
@endsection