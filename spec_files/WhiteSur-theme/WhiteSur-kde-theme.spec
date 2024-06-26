%define debug_package %{nil}
%define __os_install_post %{nil}

Name: WhiteSur-kde
Summary: WhiteSur KDE Theme

Version: {{{ git_dir_version }}}
License: GPLv3
Release: 1%{?dist}
URL:     https://github.com/vinceliuice/WhiteSur-kde
Source0: %{url}/archive/master/WhiteSur-kde-master.tar.gz

BuildArch: noarch
BuildRequires: coreutils

Requires: kvantum

%description
WhiteSur KDE theme

%prep
%setup -q -n %{name}-master

%install
SDDM_DIR=%{buildroot}%{_datadir}/sddm/themes

mkdir -p ${SDDM_DIR}

cp -r sddm/WhiteSur-* ${SDDM_DIR}
./install.sh

%files
%{_datadir}/aurorae/themes
%{_datadir}/color-schemes
%{_datadir}/plasma/desktoptheme
%{_datadir}/plasma/look-and-feel
%{_datadir}/plasma/layout-templates
%{_datadir}/Kvantum
%{_datadir}/wallpapers
%{_datadir}/sddm/themes

%changelog
{{{ git_dir_changelog }}}

