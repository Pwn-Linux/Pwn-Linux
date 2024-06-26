Name:           Ventura-gtk-theme
Version:        {{{ git_dir_version }}}
Release:        1%{?dist}
Summary:        macOS theme
BuildArch:      noarch
License:        GPLv3
URL:            https://github.com/B00merang-Project/
Source0:        %{url}/macOS/archive/master/macOS-master.tar.gz

BuildRequires:  sassc
BuildRequires:  glib2-devel
BuildRequires:  inkscape
BuildRequires:  optipng
BuildRequires:  ImageMagick

%description
WhiteSur is a MacOS Big Sur like theme for GTK 3, GTK 2 and Gnome-Shell which supports
GTK 3 and GTK 2 based desktop environments like Gnome, Pantheon, XFCE, Mate, etc.

%prep
%setup -q -n macOS-master

%build

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p %{buildroot}%{_datadir}/themes
cp -r * %{buildroot}%{_datadir}/themes/macOS

%files
%license LICENSE.md
%doc README.md
%{_datadir}/themes/macOS

%changelog
{{{ git_dir_changelog }}}