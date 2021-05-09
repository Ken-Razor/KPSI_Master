@extends('../layout_dsn.dsn')
@section('title-dosen')
Daftar Bimbingan Dosen
@endsection
@section('content')
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <h1 class="h3 mb-4 text-gray-800" style="padding-left:15px;">DAFTAR BIMBINGAN</h1>

                        <form
                            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group" style="padding-left:10px; padding-top:30px;">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Cari data.."
                                    aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr class="center">
                                        <th style="width:2%;">No</th>
                                        <th style="width:10%;">Nim</th>
                                        <th style="width:15%;">Nama</th>
                                        <th style="width:25%;">Judul</th>
                                        <th style="width:15%;">Lembaga</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Main Content -->

@endsection