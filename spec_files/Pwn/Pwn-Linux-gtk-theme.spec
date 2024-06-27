Name:           Pwn-Linux-gtk-theme
Version:        {{{ git_dir_version }}}
Release:        1%{?dist}
Summary:        Pwn Linux gtk themeing highly inspired by macOS
BuildArch:      noarch
License:        GPLv3
URL:            https://github.com/Pwn-Linux
Source0:        %{url}/Pwn-Linux-gtk/archive/master/Pwn-Linux-gtk-master.tar.gz

%description
Pwn Linux gtk themeing highly inspired by macOS

%prep
%setup -q -n Pwn-Linux-gtk-master

%build

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p %{buildroot}%{_datadir}/themes/Pwn
cp -r * %{buildroot}%{_datadir}/themes/Pwn

%files
%license LICENSE
%doc README.md
%{_datadir}/themes/Pwn

%changelog
{{{ git_dir_changelog }}}