<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Core</div>
                <a class="nav-link" href="{{ url('/') }}">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    Dashboard
                </a>
                <a class="nav-link" href="{{ route('majelis.index') }}">
                    <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                    Majelis
                </a>
                <div class="sb-sidenav-menu-heading">Interface</div>
                <a class="nav-link collapsed akses-adm" href="#" data-bs-toggle="collapse"
                    data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                    Alat Tulis Kantor
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                    data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                            Items
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordionPages">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="{{ route('items.index') }}">Items</a>
                            </nav>
                        </div>
                        <a class="nav-link" href="{{ route('barangMasuk.index') }}">Barang Masuk</a>
                        <a class="nav-link" href="{{ route('transaksi.index') }}">Transaksi</a>
                        <a class="nav-link" href="{{ route('barangKeluar.index') }}">Barang Keluar</a>
                        <a class="nav-link" href="{{ route('stokItems.index') }}">Stok Items</a>
                    </nav>
                </div>
                <a class="nav-link collapsed akses-adm" href="#" data-bs-toggle="collapse"
                    data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Wakalah
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                    data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="{{ route('wakalahInput.index') }}">Input Wakalah</a>
                        <a class="nav-link" href="{{ route('wakalah.saldo') }}">Saldo Wakalah</a>
                    </nav>
                </div>

                <a class="nav-link collapsed akses-adm" href="#" data-bs-toggle="collapse" data-bs-target="#sp3"
                    aria-expanded="false" aria-controls="collapsePages">
                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                    SP3
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="sp3" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">

                    </nav>
                </div>
                <div class="sb-sidenav-menu-heading">Random</div>
                <a class="nav-link" href="{{ route('mba.index') }}">
                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                    MBA
                </a>
                <a class="nav-link" href="{{ route('validasi') }}">
                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                    Validasi Tabungan
                </a>
                <a class="nav-link" href="{{ route('petugas.index') }}">
                    <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                    Petugas
                </a>
                <a class="nav-link" href="{{ route('kol.index') }}">
                    <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                    PAR
                </a>
            </div>
        </div>
    </nav>
</div>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
    integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>
    const passwordAdm = 845;
    const passwordTpl = 776;

    $('#menu-transaksi').click(function (e) {
        const valid = prompt('masukan password:')
        if (valid != passwordAdm) {
            return false;
        }
    });

</script>
