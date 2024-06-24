Name:          appmenu-gtk-module
Version:       24.05

%global forgeurl https://gitlab.com/vala-panel-project/vala-panel-appmenu
%global tag    %{version}
%global date   20240522
%forgemeta

Release:       1%{?dist}
Summary:       GTK+ module for exporting old-style menus as GMenuModels
License:       LGPL-3.0-only
URL:           %{forgeurl}
Source0:       %{forgesource}
Source1:       80-%{name}.sh

BuildRequires: bamf-daemon
BuildRequires: gettext
BuildRequires: gtk-doc
BuildRequires: libtool
BuildRequires: meson
BuildRequires: ninja-build
BuildRequires: python3-devel
BuildRequires: systemd-rpm-macros
BuildRequires: vala

BuildRequires: pkgconfig(gtk+-2.0)
BuildRequires: pkgconfig(gtk+-3.0)
BuildRequires: pkgconfig(systemd)
BuildRequires: pkgconfig(libbamf3)
BuildRequires: pkgconfig(libwnck-3.0)
BuildRequires: pkgconfig(x11)
BuildRequires: pkgconfig(dbusmenu-glib-0.4)

%description
GTK+ module for exporting old-style menus as GMenuModels. Many applications
implement menus as GtkMenuShells and GtkMenuItems and aren't looking to migrate
to the newer GMenuModel API. This GTK+ module watches for these types of menus
and exports the appropriate GMenuModel implementation.

#-------------------------------------------------------------------------------

%package -n    libappmenu-gtk-parser-devel
Summary:       Common development-files for libappmenu-gtk{2,3}-parser
BuildArch:     noarch

%description -n libappmenu-gtk-parser-devel
This package contains common headers and documentation for
libappmenu-gtk{2,3}-parser.

%files -n       libappmenu-gtk-parser-devel
%{_includedir}/appmenu-gtk-parser

#-------------------------------------------------------------------------------

%package -n     libappmenu-gtk2-parser
Summary:        Gtk2MenuShell to GMenuModel parser

%description -n libappmenu-gtk2-parser
This library converts Gtk2MenuShells into GMenuModels.

%files -n       libappmenu-gtk2-parser
%{_libdir}/libappmenu-gtk2-parser.so.*

#-------------------------------------------------------------------------------

%package -n     libappmenu-gtk2-parser-devel
Summary:        Development-files for libappmenu-gtk2-parser

Requires:       gtk2-devel%{?_isa}
Requires:       libappmenu-gtk-parser-devel    == %{version}-%{release}
Requires:       libappmenu-gtk2-parser%{?_isa}    == %{version}-%{release}

%description -n libappmenu-gtk2-parser-devel
This package contains development-files for libappmenu-gtk2-parser.

%files -n       libappmenu-gtk2-parser-devel
%{_libdir}/libappmenu-gtk2-parser.so
%{_libdir}/pkgconfig/appmenu-gtk2-parser.pc

#-------------------------------------------------------------------------------

%package -n     libappmenu-gtk3-parser
Summary:        Gtk3MenuShell to GMenuModel parser

%description -n libappmenu-gtk3-parser
This library converts Gtk3MenuShells into GMenuModels.

%files -n       libappmenu-gtk3-parser
%{_libdir}/libappmenu-gtk3-parser.so.*

#-------------------------------------------------------------------------------

%package -n     libappmenu-gtk3-parser-devel
Summary:        Development-files for libappmenu-gtk3-parser

Requires:       gtk3-devel%{?_isa}
Requires:       libappmenu-gtk-parser-devel    == %{version}-%{release}
Requires:       libappmenu-gtk3-parser%{?_isa}    == %{version}-%{release}

%description -n libappmenu-gtk3-parser-devel
This package contains development-files for libappmenu-gtk3-parser.

%files -n       libappmenu-gtk3-parser-devel
%{_libdir}/libappmenu-gtk3-parser.so
%{_libdir}/pkgconfig/appmenu-gtk3-parser.pc

#-------------------------------------------------------------------------------

%package        common
Summary:        Common files for appmenu-gtk{2,3}-module

Requires:       /bin/sh
Requires:       bamf-daemon
Requires:       dbus
Requires:       gawk
Requires:       sed
Requires:       systemd

%description -n appmenu-gtk-module-common
This package contains common data-files for appmenu-gtk{2,3}-module.

%files -n       appmenu-gtk-module-common
%license %{_defaultlicensedir}/%{name}/LICENSE
%doc %{_docdir}/%{name}/{AUTHORS,README.md,TODO}
%{_datadir}/glib-2.0/schemas/org.appmenu.gtk-module.gschema.xml
%{_userunitdir}/%{name}.service
%{_sysconfdir}/X11/xinit/xinitrc.d/80-%{name}.sh

#-------------------------------------------------------------------------------

%package -n     appmenu-gtk2-module
Summary:        Gtk2MenuShell D-Bus exporter

Requires:       libappmenu-gtk2-parser%{?_isa}    == %{version}-%{release}
Requires:       appmenu-gtk-module-common        == %{version}-%{release}

Provides:       appmenu-gtk            == %{version}-%{release}
Provides:       appmenu-gtk%{?_isa}        == %{version}-%{release}

%description -n appmenu-gtk2-module
This GTK+ 2 module exports Gtk2MenuShells over D-Bus.

%files -n       appmenu-gtk2-module
%{_libdir}/gtk-2.0/modules/lib%{name}.so

#-------------------------------------------------------------------------------

%package -n     appmenu-gtk3-module
Summary:        Gtk3MenuShell D-Bus exporter

Requires:       libappmenu-gtk3-parser%{?_isa}    == %{version}-%{release}
Requires:       appmenu-gtk-module-common        == %{version}-%{release}

Provides:       appmenu-gtk3            == %{version}-%{release}
Provides:       appmenu-gtk3%{?_isa}        == %{version}-%{release}

%description -n appmenu-gtk3-module
This GTK+ 3 module exports Gtk3MenuShells over D-Bus.

%files -n       appmenu-gtk3-module
%{_libdir}/gtk-3.0/modules/lib%{name}.so

#-------------------------------------------------------------------------------

%prep
%forgeautosetup

# Setup systemd-unit for Fedora.
f="subprojects/appmenu-gtk-module/data/%{name}.service.in"
%{__sed} -i.orig -e's!xfce-session.target$!default.target!g' \
    -e's!mate-session.target$!default.target!g' -e's!gnome-session.target$!default.target!g' \
    -e's!@CMAKE_INSTALL_FULL_BINDIR@$!%{_bindir}!g' ${f}
%{_bindir}/touch -r ${f}.orig ${f} && %{__rm} ${f}.orig

%build
pushd subprojects/appmenu-gtk-module
%meson
%meson_build
popd

%install
pushd subprojects/appmenu-gtk-module
%meson_install
popd

install -Dm755 %{SOURCE1} -t %{buildroot}%{_sysconfdir}/X11/xinit/xinitrc.d/

%post -n appmenu-gtk-module-common
%systemd_user_post appmenu-gtk-module.service

%preun -n appmenu-gtk-module-common
%systemd_user_preun appmenu-gtk-module.service

%postun -n appmenu-gtk-module-common
%systemd_user_postun_with_restart appmenu-gtk-module.service

%changelog
* Fri Jun 21 2024 Dipta Biswas <dabiswas112@gmail.com> - 24.05-1
- Initial package (adatped from unity-gtk-module)
