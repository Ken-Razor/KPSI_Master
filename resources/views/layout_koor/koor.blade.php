<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>@yield('title-koor')</title>

    <!-- Custom fonts for this template-->
    <link href="{{asset('vendor1/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="{{asset('css/sb-admin-2.min.css')}}" rel="stylesheet">
    <link href="{{asset('css/new.css')}}" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">SIKP - Koordinator</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Home</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="/koor/verifikasi_sk">
                    <i class="fas fa-clipboard-list"></i>
                    <span>Verifikasi Surat KP</span></a>
            </li>

             <li class="nav-item">
                <a class="nav-link" href="/koor/verifikasi_prakp">
                    <i class="fas fa-clipboard-list"></i>
                    <span>Verifikasi Pra KP</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/koor/verifikasi_kp">
                    <i class="fas fa-clipboard-list"></i>
                    <span>Verifikasi KP</span></a>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="/koor/penjadwalan_ujian">
                    <i class="fas fa-clipboard-list"></i>
                    <span>Penjadwalan Ujian</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/koor/lihat/daftar/registrasi">
                    <i class="fas fa-clipboard-list"></i>
                    <span>Melihat daftar registrasi KP</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/koor/batas/pelaksaan/kp">
                    <i class="fas fa-clipboard-list"></i>
                    <span>Set Batas Pelaksanaan KP</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/koor/set/ajaran">
                    <i class="fas fa-clipboard-list"></i>
                    <span>Set Ajaran</span></a>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>        

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">{{Auth::guard('koor')->user()->nama_koor}}</span>
                                <!-- <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg"> -->
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <!-- End of Topbar -->
                @if (session('status'))
        <div class="alert alert-success" role="alert">
             {{ session('status') }}
        </div>
            @endif

            <div class="panel-heading">
                                @if(session('sukses-tambah'))
                                <div class="alert alert-success mt-8" role="alert" >
                                    {{session('sukses-tambah')}}
                                </div>
                                @endif
                        </div>

            <div class="panel-heading">
                                @if(session('sukses-ubah'))
                                <div class="alert alert-warning  mt-8" role="alert" >
                                    {{session('sukses-ubah')}}
                                </div>
                                @endif
                        </div>

            <div class="panel-heading">
                                @if(session('sukses-hapus'))
                                <div class="alert alert-danger  mt-8" role="alert" >
                                    {{session('sukses-hapus')}}
                                </div>
                                @endif
                        </div>
                <!-- Main Content -->
                    @yield('content')
                <!-- End Content -->
<!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; WilKenKris 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Duhh..yakin nih mau keluar ?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/logout">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="{{asset('vendor1/jquery/jquery.min.js')}}"></script>
    <script src="{{asset('vendor1/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

    <!-- Core plugin JavaScript-->
    <script src=>"{{asset('vendor1/jquery-easing/jquery.easing.min.js')}}"</script>

    <!-- Custom scripts for all pages-->
    <script src="{{asset('js/sb-admin-2.min.js')}}"></script>

</body>

</html>