%global hash b6587fe

Name:           WhiteSur-gtk-theme
Version:        2024-05-01
Release:        %{version}%
Summary:        WhiteSur is a MacOS Big Sur like theme
BuildArch:      noarch
License:        GPLv3
URL:            https://github.com/vinceliuice/WhiteSur-gtk-theme
Source0:        %{version}%.tar.xz

BuildRequires:  sassc
BuildRequires:  glib2-devel
BuildRequires:  inkscape
BuildRequires:  optipng 
BuildRequires:  ImageMagick


%description
WhiteSur is a MacOS Big Sur like theme for GTK 3, GTK 2 and Gnome-Shell which supports 
GTK 3 and GTK 2 based desktop environments like Gnome, Pantheon, XFCE, Mate, etc.

%prep
%autosetup -n %{name}-%{version}%{?hash:.git%{hash}}
sed -i -e "s|SUDO_BIN=.*|SUDO_BIN=\"/usr/bin/sudo\"|g" shell/lib-core.sh

%build


%install
rm -rf $RPM_BUILD_ROOT
mkdir -p %{buildroot}%{_datadir}/themes
./install.sh --dest %{buildroot}%{_datadir}/themes
rm -rf %{buildroot}%{_datadir}/themes/{*-hdpi,*-xhdpi}

%files
%license COPYING 
%doc README.md
%{_datadir}/themes/WhiteSur-*


%changelog
* Thu Jul 13 2023 Tomas Chang <changyp6@gmail.com> - 20230710-0.1.git679d6f9
- Latest git

