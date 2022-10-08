<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>{{ $title }}</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
    <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
    <link href="{{ url('') }}/public/dist/css/styles.css" rel="stylesheet" />
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous">
    </script>
    <style>
        .form-login {
            display: flex;
            height: 100%;
            justify-content: center;
            align-items: center;
        }

        form {
            background-color: #00d1b2;
            width: 400px;
            height: 300px;
            margin: 0 auto;
            box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.253);
        }

        .buatan {
            width: 400px;
        }


        .btn-hijau {
            background-color: #485fc7;
            color: #f5f5f5
        }

        .btn-hijau:hover {
            background-color: #4458b1e1;
            border: none;
            color: #f5f5f5;
        }

        .alert-danger {
            background-color: #ff3860;
            color: #f5f5f5;
        }

    </style>
</head>

<body class="sb-nav-fixed" style="background-color: #f5f5f5">
    <div class="form-login">
        <div class="row">
            <div class="col-12">
                @if (Session::get('error'))
                <div class="alert alert-danger rounded-0" role="alert">
                    {{ Session::get('error') }}!
                </div>
                @endif
                <form class="py-3 px-4" action="{{ route('loginaksi') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <h2 class="fw-lighter text-white text-center">Silahkan Login</h2>
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control rounded-0 border-bottom-0p py-3" id="email"
                            placeholder="Email" name="email">
                        <input type="password" class="form-control rounded-0 py-3" id="password" name="password"
                            placeholder="Password">
                    </div>
                    <button type="submit" class="btn btn-hijau rounded-0 w-100 py-3">Login</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous">
    </script>
    <script src="{{ url('') }}/public/dist/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="{{ url('') }}/public/dist/assets/demo/chart-area-demo.js"></script>
    <script src="{{ url('') }}/public/dist/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    {{-- <script src="{{ url('') }}/public/dist/js/datatables-simple-demo.js"></script> --}}
    <script src="{{ url('') }}/public/script.js"></script>
    <script src="{{ url('') }}/public/autoNumeric.js"></script>

    <script>
        $(document).ready(function () {
            const datatablesSimple = document.getElementById('Barang');
            if (datatablesSimple) {
                new simpleDatatables.DataTable(datatablesSimple);
            }
        });

    </script>
</body>

</html>
