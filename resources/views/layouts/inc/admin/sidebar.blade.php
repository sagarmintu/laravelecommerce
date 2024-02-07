<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item {{ Request::is('admin/dashboard') ? 'active': '' }}">
            <a class="nav-link" href="{{ url('admin/dashboard') }}">
                <i class="mdi mdi-home menu-icon"></i>
                <span class="menu-title">Dashboard</span>
            </a>
        </li>
        <li class="nav-item {{ Request::is('admin/orders') ? 'active': '' }}">
            <a class="nav-link" href="{{ url('admin/orders') }}">
                <i class="mdi mdi-sale menu-icon"></i>
                <span class="menu-title">Orders</span>
            </a>
        </li>
        <li class="nav-item {{ Request::is('admin/category*') ? 'active': '' }}">
            <a class="nav-link" data-bs-toggle="collapse" href="#category" aria-expanded="{{ Request::is('admin/category*') ? 'true': 'false' }}">
                <i class="mdi mdi-circle-outline menu-icon"></i>
                <span class="menu-title">Category</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse {{ Request::is('admin/category*') ? 'show': '' }}" id="category">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> 
                        <a class="nav-link {{ Request::is('admin/category/create') ? 'active': '' }}" href="{{ url('admin/category/create') }}">Add Category</a>
                    </li>
                    <li class="nav-item"> 
                        <a class="nav-link {{ Request::is('admin/category') || Request::is('admin/category/*/edit') ? 'active': '' }}" href="{{ url('admin/category') }}">View Category</a>
                    </li>
                </ul>
            </div>
        </li>

        <li class="nav-item {{ Request::is('admin/products*') ? 'active': '' }}">
            <a class="nav-link" data-bs-toggle="collapse" href="#product" aria-expanded="{{ Request::is('admin/products*') ? 'true': 'false' }}">
                <i class="mdi mdi-view-headline menu-icon"></i>
                <span class="menu-title">Products</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse {{ Request::is('admin/products*') ? 'show': '' }}" id="product">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> 
                        <a class="nav-link { Request::is('admin/products/create') ? 'active': '' }}" href="{{ url('admin/products/create') }}">Add Products</a>
                    </li>
                    <li class="nav-item"> 
                        <a class="nav-link {{ Request::is('admin/products') || Request::is('admin/products/*/edit') ? 'active': '' }}" href="{{ url('admin/products/') }}">View Products</a>
                    </li>
                </ul>
            </div>
        </li>

        <li class="nav-item {{ Request::is('admin/brands') ? 'active': '' }}">
            <a class="nav-link" href="{{ url('admin/brands') }}">
                <i class="mdi mdi-chart-pie menu-icon"></i>
                <span class="menu-title">Brand</span>
            </a>
        </li>
        <li class="nav-item {{ Request::is('admin/colors') ? 'active': '' }}">
            <a class="nav-link" href="{{ url('admin/colors') }}">
                <i class="mdi mdi-grid-large menu-icon"></i>
                <span class="menu-title">Colors</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                <i class="mdi mdi-account menu-icon"></i>
                <span class="menu-title">User</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="{{ url('admin/users') }}"> Add User </a></li>
                    <li class="nav-item"> <a class="nav-link" href="{{ url('admin/users') }}"> View User </a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item {{ Request::is('admin/sliders') ? 'active': '' }}">
            <a class="nav-link" href="{{ url('admin/sliders') }}">
                <i class="mdi mdi-view-carousel menu-icon"></i>
                <span class="menu-title">Home Slider</span>
            </a>
        </li>
        <li class="nav-item {{ Request::is('admin/settings') ? 'active': '' }}">
            <a class="nav-link" href="{{ url('admin/settings') }}">
                <i class="mdi mdi-file-document-box-outline menu-icon"></i>
                <span class="menu-title">Site Setting</span>
            </a>
        </li>
    </ul>
</nav>