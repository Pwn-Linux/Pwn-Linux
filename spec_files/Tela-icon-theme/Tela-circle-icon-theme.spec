%global hash 0e9d7a7
%global date 20230703
%define debug_package %{nil}
%define __os_install_post %{nil}

Name: WhiteSur-icon-theme
Summary: White Sur Icon Theme

Version: %{date}
License: GPLv3
Release: %{?hash:0.1.git%{hash}}%{!?hash:1}%{?dist}
URL:     https://github.com/vinceliuice/WhiteSur-icon-theme
Source0: %{name}-%{date}%{?hash:.git%{hash}}.tar.%{?hash:xz}%{!?hash:gz}

BuildArch: noarch
BuildRequires: coreutils

%description
WhiteSur icon theme

%prep
%autosetup -n %{name}-%{date}%{?hash:.git%{hash}}
sed -i -e "/gtk-update-icon-cache/d" install.sh
sed -i -e "/budgie-desktop/,+2d" install.sh

%build

%install
DEST=%{buildroot}%{_datadir}/icons
mkdir -p ${DEST}
./install.sh -t all -d ${DEST} -n WhiteSur
##./install.sh -t all -d ${DEST} -n WhiteSurBold -b

%files
%{_datadir}/icons/WhiteSur{,-green,-grey,-nord,-orange,-pink,-purple,-red,-yellow}{,-dark,-light}

%changelog
* Thu Jul 13 2023 Tomas Chang <changyp6@gmail.com> - 20230703-0.1.git0e9d7a7
- Update to latest git

* Sat Oct 08 2022 Tomas Chang <changyp6@gmail.com> - 20220929-0.1.gitd002bf27
- Initial build

