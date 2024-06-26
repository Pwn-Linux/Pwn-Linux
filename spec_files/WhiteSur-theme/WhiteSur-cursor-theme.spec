%global hash 5c94e8c
%global date 20220617
%define debug_package %{nil}
%define __os_install_post %{nil}

Name: WhiteSur-cursor-theme
Summary: WhiteSur cursor Theme

Version: {{{ git_dir_version }}}
License: GPLv3
Release: 1%{?dist}
URL:     https://github.com/vinceliuice/WhiteSur-icon-theme
Source0: %{url}/archive/master/WhiteSur-icon-theme-master.tar.gz

BuildArch: noarch
BuildRequires: coreutils

%description
WhiteSur cursor theme

%prep
%setup -q -n WhiteSur-icon-theme-master

%build

%install
DEST=%{buildroot}%{_datadir}/icons
mkdir -p ${DEST}
cp -r dist ${DEST}/WhiteSur-cursor

%files
%{_datadir}/icons/WhiteSur-cursor

%changelog
{{{ git_dir_changelog }}}

