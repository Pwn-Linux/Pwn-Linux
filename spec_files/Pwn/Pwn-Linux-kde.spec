%define debug_package %{nil}
%define __os_install_post %{nil}

Name: Pwn-Linux-kde
Summary: Pwn Linux KDE Theme

Version: {{{ git_dir_version }}}
License: GPLv3
Release: 1%{?dist}
URL:     https://github.com/Pwn-Linux/Pwn-Linux-kde
Source0: %{url}/archive/master/Pwn-Linux-kde-main.tar.gz

BuildArch: noarch
BuildRequires: coreutils

#Requires: kvantum

%description
Pwn Linux KDE theme

%prep
%setup -q -n %{name}-main

%install
AURORAE_DIR=%{buildroot}%{_datadir}/aurorae/themes
SCHEMES_DIR=%{buildroot}%{_datadir}/color-schemes
PLASMA_DIR=%{buildroot}%{_datadir}/plasma/desktoptheme
LOOKFEEL_DIR=%{buildroot}%{_datadir}/plasma/look-and-feel
LAYOUT_TEMPLATE_DIR=%{buildroot}%{_datadir}/plasma/layout-templates
WALLPAPER_DIR=%{buildroot}%{_datadir}/wallpapers
SDDM_DIR=%{buildroot}%{_datadir}/sddm/themes

mkdir -p ${AURORAE_DIR}
mkdir -p ${SCHEMES_DIR}
mkdir -p ${PLASMA_DIR}
mkdir -p ${LOOKFEEL_DIR}
mkdir -p ${LAYOUT_TEMPLATE_DIR}
#mkdir -p ${WALLPAPER_DIR}
#mkdir -p ${SDDM_DIR}

cp -r aurorae/*                       ${AURORAE_DIR}
cp -r color-schemes/*                 ${SCHEMES_DIR}
cp -r plasma/desktoptheme/Pwn*        ${PLASMA_DIR}
cp -r plasma/desktoptheme/icons       ${PLASMA_DIR}/Pwn-Light
cp -r plasma/desktoptheme/icons       ${PLASMA_DIR}/Pwn-Dark
cp -r plasma/look-and-feel/*          ${LOOKFEEL_DIR}
cp -r plasma/layout-templates/*       ${LAYOUT_TEMPLATE_DIR}
#cp -r wallpapers/Pwn*                ${WALLPAPER_DIR}
#cp -r sddm/Pwn*                      ${SDDM_DIR}

%files
%{_datadir}/aurorae/themes
%{_datadir}/color-schemes
%{_datadir}/plasma/desktoptheme
%{_datadir}/plasma/look-and-feel
%{_datadir}/plasma/layout-templates
#%{_datadir}/wallpapers
#%{_datadir}/sddm/themes

%changelog
{{{ git_dir_changelog }}}

