%% This is an -*- erlang -*- file.
%%
%% %CopyrightBegin%
%%
%% Copyright Ericsson AB 2010. All Rights Reserved.
%%
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%%
%% %CopyrightEnd%

{application, wx,
 [{description, "Yet another graphics system"},
  {vsn, "1.3.1"},
  {modules,
   [
    %% Generated modules
  wxIcon, wxColourPickerEvent, wxBitmapButton, wxImage, wxGraphicsContext, wxPreviewFrame, wxCheckListBox, wxColourData, wxEvtHandler, wxFileDialog, wxFlexGridSizer, wxPrintDialogData, wxScrolledWindow, wxMouseCaptureChangedEvent, wxClipboardTextEvent, wxMoveEvent, wxChoicebook, wxSystemOptions, wxGridCellFloatRenderer, wxWindowDC, wxColourDialog, wxHtmlLinkEvent, wxStatusBar, wxInitDialogEvent, wxEraseEvent, wxXmlResource, wxShowEvent, wxGraphicsObject, wxPrintout, wxDateEvent, wxSysColourChangedEvent, wxGraphicsPath, wxLocale, wxGraphicsMatrix, wxBitmap, wxQueryNewPaletteEvent, wxCalendarCtrl, wxSizerItem, wxFrame, wxNavigationKeyEvent, wxFontData, wxGraphicsRenderer, wxGridCellBoolRenderer, wxTextEntryDialog, wxIdleEvent, wxStyledTextCtrl, wxChoice, wxListItem, wxSpinCtrl, wxMDIClientWindow, wxMDIChildFrame, wxStdDialogButtonSizer, wxFontPickerEvent, wxPrintData, wxDirPickerCtrl, wxKeyEvent, wxEvent, wxFontDialog, wxCalendarDateAttr, wxGridCellEditor, wxPalette, wxGridCellNumberRenderer, wxSizeEvent, wxLogNull, wxIconBundle, wxClientDC, wxTreebook, wxDirDialog, wxGridEvent, wx_misc, wxGridCellStringRenderer, wxPreviewCanvas, wxTextAttr, wxComboBox, wxScrollWinEvent, wxGraphicsBrush, wxWindowDestroyEvent, wxSetCursorEvent, wxGridCellChoiceEditor, wxMirrorDC, wxControl, wxToggleButton, wxGraphicsFont, wxStaticText, wxIconizeEvent, wxJoystickEvent, wxGridBagSizer, wxGridSizer, wxScrollEvent, wxWindowCreateEvent, wxSashLayoutWindow, wxGridCellFloatEditor, wxStyledTextEvent, wxStaticBox, wxBufferedDC, wxTextCtrl, wxRadioButton, wxStaticBitmap, wxListCtrl, wxCalendarEvent, wxGauge, wxSizerFlags, wxGridCellTextEditor, wxPrintPreview, wxFindReplaceDialog, wxGridCellRenderer, wxPreviewControlBar, wxStaticLine, wxMiniFrame, wxDisplayChangedEvent, wxListEvent, wxCursor, wxDialog, wxPaintDC, wxScreenDC, wxPopupWindow, wxColourPickerCtrl, wxFilePickerCtrl, wxRadioBox, wxFindReplaceData, wxPostScriptDC, wxGrid, wxMask, wxScrollBar, wxMenuEvent, wxCheckBox, wxListItemAttr, wxAuiManager, wxBoxSizer, wxClipboard, wxMouseEvent, wxMenu, wxSashWindow, wxAuiPaneInfo, wxPaintEvent, wxSplitterWindow, wxProgressDialog, wxGridCellNumberEditor, wxListBox, wxActivateEvent, wxFileDirPickerEvent, wxMenuItem, wxChildFocusEvent, wxMessageDialog, wxButton, wxMaximizeEvent, wxToolBar, wxGraphicsPen, wxPaletteChangedEvent, wxArtProvider, wxHtmlEasyPrinting, wxNotebook, wxBufferedPaintDC, wxTreeCtrl, wxPasswordEntryDialog, wxRegion, wxListView, wxSplitterEvent, wxAuiManagerEvent, wxGridCellAttr, wxContextMenuEvent, wxLayoutAlgorithm, wxGridCellBoolEditor, wxMultiChoiceDialog, wxTaskBarIconEvent, wxNotebookEvent, wxAuiDockArt, wxHtmlWindow, wxPageSetupDialog, wxCommandEvent, wxBitmapDataObject, wxDatePickerCtrl, wxFocusEvent, wxListbook, wxImageList, wxAuiNotebook, wxNotifyEvent, wxToolTip, wxSlider, wxAcceleratorEntry, wxSizer, wxMenuBar, wxPageSetupDialogData, wxGBSizerItem, wxPen, wxBrush, wxAuiNotebookEvent, wxGLCanvas, wxPanel, wxStaticBoxSizer, wxSashEvent, wxUpdateUIEvent, wxTopLevelWindow, wxSplashScreen, wxMemoryDC, wxToolbook, wxTaskBarIcon, wxPopupTransientWindow, wxPrintDialog, wxFileDataObject, wxFontPickerCtrl, wxPickerBase, wxCloseEvent, wxTextDataObject, wxDC, wxCaret, wxAcceleratorTable, wxMDIParentFrame, wxHelpEvent, wxSpinButton, wxGenericDirCtrl, wxFont, wxDataObject, wxControlWithItems, wxSystemSettings, wxWindow, wxTreeEvent, wxSpinEvent, wxSingleChoiceDialog, wxPrinter, wxAuiTabArt, glu, gl,
    %% Handcrafted modules
    wx,
    wx_object,
    wxe_master,
    wxe_server,
    wxe_util
   ]},
  {registered, []},
  {applications, [stdlib, kernel]},
  {env, []},
  {runtime_dependencies, ["stdlib-2.0","kernel-3.0","erts-6.0"]}
 ]}.
