//
//  UITableView+ClosureDelegate.swift
//  HANABI
//
//  Created by Shunsaku Miki on 2018/12/11.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

import UIKit

public extension UITableView {
    
    private func setClosureToDataSource(tableViewDataSource blocks: [String: Any]) {
        dataSource = BaseDelegateObject.generate(delegateObject: self, proto: UITableViewDataSource.self, blocks: blocks) as? UITableViewDataSource
    }
    
    private func setClosureToDelegate(tableViewDelegate blocks: [String: Any]) {
        delegate = BaseDelegateObject.generate(delegateObject: self, proto: UITableViewDelegate.self, blocks: blocks) as? UITableViewDelegate
    }
    
    /// TableViewのDataSourceをClosureで設定する
    ///
    /// - Parameters:
    ///   - numberOfRows: @required numberOfRows
    ///   - cellForRowAt: @required cellForRowAt
    ///   - numberOfSections: numberOfSections
    ///   - titleForHeaderInSection: titleForHeaderInSection
    ///   - titleForFooterInSection: titleForFooterInSection
    ///   - canEditRowAtIndexPath: canEditRowAtIndexPath
    ///   - canMoveRowAtIndexPath: canMoveRowAtIndexPath
    ///   - sectionIndexTitles: sectionIndexTitles
    ///   - sectionIndexTitle: sectionIndexTitle
    ///   - commitEditingStyle: commitEditingStyle
    ///   - moveRowAtIndexPath: moveRowAtIndexPath
    func setClosureToTableViewDataSource(
        numberOfRows: @escaping (_ tableView: UITableView, _ section: Int) -> Int,
        cellForRowAt: @escaping (_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell,
        numberOfSections: ((_ tableView: UITableView) -> Int)? = nil,
        titleForHeaderInSection: ((_ tableView: UITableView, _ section: Int) -> String?)? = nil,
        titleForFooterInSection: ((_ tableView: UITableView, _ section: Int) -> String?)? = nil,
        canEditRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> Bool)? = nil,
        canMoveRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> Bool)? = nil,
        sectionIndexTitles: ((_ tableView: UITableView) -> [String]?)? = nil,
        sectionIndexTitle: ((_ tableView: UITableView, _ title: String, _ index: Int) -> Int)? = nil,
        commitEditingStyle: ((_ tableView: UITableView, _ editingStyle: UITableViewCell.EditingStyle, _ indexPath: NSIndexPath) -> ())? = nil,
        moveRowAtIndexPath: ((_ tableView: UITableView, _ sourceIndexPath: NSIndexPath, _ destinationIndexPath: NSIndexPath) -> ())? = nil
        ) {
        
        var blocks = [String: Any]()
        
        let _numberOfRowsInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> Int in
            return numberOfRows(tableView, section)
        }
        blocks["tableView:numberOfRowsInSection:"] =
            unsafeBitCast(_numberOfRowsInSection as @convention(block) (BaseDelegateObject, UITableView, Int) -> Int, to: AnyObject.self)
        
        let _cellForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell in
            return cellForRowAt(tableView, indexPath as IndexPath)
        }
        blocks["tableView:cellForRowAtIndexPath:"] =
            unsafeBitCast(_cellForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath) -> UITableViewCell, to: AnyObject.self)
        
        if let cls = numberOfSections {
            let _numberOfSectionsInTableView = {(obj: BaseDelegateObject, tableView: UITableView) -> Int in
                return cls(tableView)
            }
            blocks["numberOfSectionsInTableView:"] =
                unsafeBitCast(_numberOfSectionsInTableView as @convention(block) (BaseDelegateObject, UITableView)->Int, to: AnyObject.self)
        }
        
        if let cls = titleForHeaderInSection {
            let _tableViewTitleForHeaderInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> String? in
                return cls(tableView, section)
            }
            blocks["tableView:titleForHeaderInSection:"] =
                unsafeBitCast(_tableViewTitleForHeaderInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->String?, to: AnyObject.self)
        }
        
        if let cls = titleForFooterInSection {
            let _tableViewTitleForFooterInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> String? in
                return cls(tableView, section)
            }
            blocks["tableView:titleForFooterInSection:"] =
                unsafeBitCast(_tableViewTitleForFooterInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->String?, to: AnyObject.self)
        }
        
        if let cls = canEditRowAtIndexPath {
            let _tableViewCanEditRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> Bool in
                return cls(tableView, indexPath)
            }
            blocks["tableView:canEditRowAtIndexPath:"] =
                unsafeBitCast(_tableViewCanEditRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->Bool, to: AnyObject.self)
        }
        
        if let cls = canMoveRowAtIndexPath {
            let _tableViewCanMoveRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> Bool in
                return cls(tableView, indexPath)
            }
            blocks["tableView:canMoveRowAtIndexPath:"] =
                unsafeBitCast(_tableViewCanMoveRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->Bool, to: AnyObject.self)
        }
        
        if let cls = sectionIndexTitles {
            let _sectionIndexTitlesForTableView = {(obj: BaseDelegateObject, tableView: UITableView) -> [String]? in
                return cls(tableView)
            }
            blocks["sectionIndexTitlesForTableView:"] =
                unsafeBitCast(_sectionIndexTitlesForTableView as @convention(block) (BaseDelegateObject, UITableView)->[String]?, to: AnyObject.self)
        }
        
        if let cls = sectionIndexTitle {
            let _tableViewSectionForSectionIndexTitle = {(obj: BaseDelegateObject, tableView: UITableView, title: String, index: Int) -> Int in
                return cls(tableView, title, index)
            }
            blocks["tableView:sectionForSectionIndexTitle:atIndex:"] =
                unsafeBitCast(_tableViewSectionForSectionIndexTitle as @convention(block) (BaseDelegateObject, UITableView, String, Int)->Int, to: AnyObject.self)
        }
        
        if let cls = commitEditingStyle {
            let _tableViewCommitEditingStyle = {(obj: BaseDelegateObject, tableView: UITableView, editingStyle: UITableViewCell.EditingStyle, indexPath: NSIndexPath) -> () in
                return cls(tableView, editingStyle, indexPath)
            }
            blocks["tableView:commitEditingStyle:forRowAtIndexPath:"] =
                unsafeBitCast(_tableViewCommitEditingStyle as @convention(block) (BaseDelegateObject, UITableView, UITableViewCell.EditingStyle, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = moveRowAtIndexPath {
            let _tableViewMoveRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, sourceIndexPath: NSIndexPath, destinationIndexPath: NSIndexPath) -> () in
                return cls(tableView, sourceIndexPath, destinationIndexPath)
            }
            blocks["tableView:moveRowAtIndexPath:toIndexPath:"] =
                unsafeBitCast(_tableViewMoveRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath, NSIndexPath)->(), to: AnyObject.self)
        }
        self.setClosureToDataSource(tableViewDataSource: blocks)
    }
    
    
    /// TableViewのDelegateをClosureで設定する
    ///
    /// - Parameters:
    ///   - willDisplayCell: willDisplayCell
    ///   - willDisplayHeaderView: willDisplayHeaderView
    ///   - willDisplayFooterView: willDisplayFooterView
    ///   - didEndDisplayingCell: didEndDisplayingCell
    ///   - didEndDisplayingHeaderView: didEndDisplayingHeaderView
    ///   - didEndDisplayingFooterView: didEndDisplayingFooterView
    ///   - heightForRowAtIndexPath: heightForRowAtIndexPath
    ///   - heightForHeaderInSection: heightForHeaderInSection
    ///   - heightForFooterInSection: heightForFooterInSection
    ///   - estimatedHeightForRowAtIndexPath: estimatedHeightForRowAtIndexPath
    ///   - estimatedHeightForHeaderInSection: estimatedHeightForHeaderInSection
    ///   - estimatedHeightForFooterInSection: estimatedHeightForFooterInSection
    ///   - viewForHeaderInSection: viewForHeaderInSection
    ///   - viewForFooterInSection: viewForFooterInSection
    ///   - accessoryButtonTappedForRowWithIndexPath: accessoryButtonTappedForRowWithIndexPath
    ///   - shouldHighlightRowAtIndexPath: shouldHighlightRowAtIndexPath
    ///   - didHighlightRowAtIndexPath: didHighlightRowAtIndexPath
    ///   - didUnhighlightRowAtIndexPath: didUnhighlightRowAtIndexPath
    ///   - willSelectRowAtIndexPath: willSelectRowAtIndexPath
    ///   - willDeselectRowAtIndexPath: willDeselectRowAtIndexPath
    ///   - didSelectRowAtIndexPath: didSelectRowAtIndexPath
    ///   - didDeselectRowAtIndexPath: didDeselectRowAtIndexPath
    ///   - editingStyleForRowAtIndexPath: editingStyleForRowAtIndexPath
    ///   - titleForDeleteConfirmationButtonForRowAtIndexPath: titleForDeleteConfirmationButtonForRowAtIndexPath
    ///   - editActionsForRowAtIndexPath: editActionsForRowAtIndexPath
    ///   - shouldIndentWhileEditingRowAtIndexPath: shouldIndentWhileEditingRowAtIndexPath
    ///   - willBeginEditingRowAtIndexPath: willBeginEditingRowAtIndexPath
    ///   - didEndEditingRowAtIndexPath: didEndEditingRowAtIndexPath
    ///   - targetIndexPathForMoveFromRowAtIndexPath: targetIndexPathForMoveFromRowAtIndexPath
    ///   - indentationLevelForRowAtIndexPath: indentationLevelForRowAtIndexPath
    ///   - shouldShowMenuForRowAtIndexPath: shouldShowMenuForRowAtIndexPath
    ///   - canPerformAction: canPerformAction
    ///   - performAction: performAction
    ///   - didScroll: didScroll
    ///   - didZoom: didZoom
    ///   - willBeginDragging: willBeginDragging
    ///   - willEndDragging: willEndDragging
    ///   - didEndDragging: didEndDragging
    ///   - willBeginDecelerating: willBeginDecelerating
    ///   - didEndDecelerating: didEndDecelerating
    ///   - didEndScrollingAnimation: didEndScrollingAnimation
    ///   - viewForZoomingIn: viewForZoomingIn
    ///   - willBeginZooming: willBeginZooming
    ///   - didEndZooming: didEndZooming
    ///   - shouldScrollToTop: shouldScrollToTop
    ///   - didScrollToTop: didScrollToTop
    func setClosureToTableViewDelegate(
        willDisplayCell: ((_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: NSIndexPath) -> ())? = nil,
        willDisplayHeaderView: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> ())? = nil,
        willDisplayFooterView: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> ())? = nil,
        didEndDisplayingCell: ((_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: NSIndexPath) -> ())? = nil,
        didEndDisplayingHeaderView: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> ())? = nil,
        didEndDisplayingFooterView: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> ())? = nil,
        heightForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> CGFloat)? = nil,
        heightForHeaderInSection: ((_ tableView: UITableView, _ section: Int) -> CGFloat)? = nil,
        heightForFooterInSection: ((_ tableView: UITableView, _ section: Int) -> CGFloat)? = nil,
        estimatedHeightForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> CGFloat)? = nil,
        estimatedHeightForHeaderInSection: ((_ tableView: UITableView, _ section: Int) -> CGFloat)? = nil,
        estimatedHeightForFooterInSection: ((_ tableView: UITableView, _ section: Int) -> CGFloat)? = nil,
        viewForHeaderInSection: ((_ tableView: UITableView, _ section: Int) -> UIView?)? = nil,
        viewForFooterInSection: ((_ tableView: UITableView, _ section: Int) -> UIView?)? = nil,
        accessoryButtonTappedForRowWithIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        shouldHighlightRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> Bool)? = nil,
        didHighlightRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        didUnhighlightRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        willSelectRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> NSIndexPath?)? = nil,
        willDeselectRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> NSIndexPath?)? = nil,
        didSelectRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        didDeselectRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        editingStyleForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> UITableViewCell.EditingStyle)? = nil,
        titleForDeleteConfirmationButtonForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> String?)? = nil,
        editActionsForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> [UITableViewRowAction]?)? = nil,
        shouldIndentWhileEditingRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> Bool)? = nil,
        willBeginEditingRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        didEndEditingRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        targetIndexPathForMoveFromRowAtIndexPath: ((_ tableView: UITableView, _ sourceIndexPath: NSIndexPath, _ proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath)? = nil,
        indentationLevelForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> Int)? = nil,
        shouldShowMenuForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> Bool)? = nil,
        canPerformAction: ((_ tableView: UITableView, _ action: Selector, _ indexPath: NSIndexPath, _ sender: AnyObject?) -> Bool)? = nil,
        performAction: ((_ tableView: UITableView, _ action: Selector, _ indexPath: NSIndexPath, _ sender: AnyObject?) -> ())? = nil ) {
        
        var blocks = [String: AnyObject]()
        
        // MARK: - TableView Delegate
        if let cls = willDisplayCell {
            let _tableViewWillDisplayCell = {(obj: BaseDelegateObject, tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath) -> () in
                return cls(tableView, cell, indexPath)
            }
            blocks["tableView:willDisplayCell:forRowAtIndexPath:"] =
                unsafeBitCast(_tableViewWillDisplayCell as @convention(block) (BaseDelegateObject, UITableView, UITableViewCell, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = willDisplayHeaderView {
            let _tableViewWillDisplayHeaderView = {(obj: BaseDelegateObject, tableView: UITableView, view: UIView, section: Int) -> () in
                return cls(tableView, view, section)
            }
            blocks["tableView:willDisplayHeaderView:forSection:"] =
                unsafeBitCast(_tableViewWillDisplayHeaderView as @convention(block) (BaseDelegateObject, UITableView, UIView, Int)->(), to: AnyObject.self)
        }
        
        if let cls = willDisplayFooterView {
            let _tableViewWillDisplayFooterView = {(obj: BaseDelegateObject, tableView: UITableView, view: UIView, section: Int) -> () in
                return cls(tableView, view, section)
            }
            blocks["tableView:willDisplayFooterView:forSection:"] =
                unsafeBitCast(_tableViewWillDisplayFooterView as @convention(block) (BaseDelegateObject, UITableView, UIView, Int)->(), to: AnyObject.self)
        }
        
        if let cls = didEndDisplayingCell {
            let _tableViewDidEndDisplayingCell = {(obj: BaseDelegateObject, tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath) -> () in
                return cls(tableView, cell, indexPath)
            }
            blocks["tableView:didEndDisplayingCell:forRowAtIndexPath:"] =
                unsafeBitCast(_tableViewDidEndDisplayingCell as @convention(block) (BaseDelegateObject, UITableView, UITableViewCell, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = didEndDisplayingHeaderView {
            let _tableViewDidEndDisplayingHeaderView = {(obj: BaseDelegateObject, tableView: UITableView, view: UIView, section: Int) -> () in
                return cls(tableView, view, section)
            }
            blocks["tableView:didEndDisplayingHeaderView:forSection:"] =
                unsafeBitCast(_tableViewDidEndDisplayingHeaderView as @convention(block) (BaseDelegateObject, UITableView, UIView, Int)->(), to: AnyObject.self)
        }
        
        if let cls = didEndDisplayingFooterView {
            let _tableViewDidEndDisplayingFooterView = {(obj: BaseDelegateObject, tableView: UITableView, view: UIView, section: Int) -> () in
                return cls(tableView, view, section)
            }
            
            blocks["tableView:didEndDisplayingFooterView:forSection:"] =
                unsafeBitCast(_tableViewDidEndDisplayingFooterView as @convention(block) (BaseDelegateObject, UITableView, UIView, Int)->(), to: AnyObject.self)
        }
        
        if let cls = heightForRowAtIndexPath {
            let _tableViewHeightForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> CGFloat in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:heightForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewHeightForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->CGFloat, to: AnyObject.self)
        }
        
        if let cls = heightForHeaderInSection {
            let _tableViewHeightForHeaderInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> CGFloat in
                return cls(tableView, section)
            }
            
            blocks["tableView:heightForHeaderInSection:"] =
                unsafeBitCast(_tableViewHeightForHeaderInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->CGFloat, to: AnyObject.self)
        }
        
        if let cls = heightForFooterInSection {
            let _tableViewHeightForFooterInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> CGFloat in
                return cls(tableView, section)
            }
            
            blocks["tableView:heightForFooterInSection:"] =
                unsafeBitCast(_tableViewHeightForFooterInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->CGFloat, to: AnyObject.self)
        }
        
        if let cls = estimatedHeightForRowAtIndexPath {
            let _tableViewEstimatedHeightForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> CGFloat in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:estimatedHeightForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewEstimatedHeightForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(CGFloat), to: AnyObject.self)
        }
        
        if let cls = estimatedHeightForHeaderInSection {
            let _tableViewEstimatedHeightForHeaderInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> CGFloat in
                return cls(tableView, section)
            }
            
            blocks["tableView:estimatedHeightForHeaderInSection:"] =
                unsafeBitCast(_tableViewEstimatedHeightForHeaderInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->CGFloat, to: AnyObject.self)
        }
        
        if let cls = estimatedHeightForFooterInSection {
            let _tableViewEstimatedHeightForFooterInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> CGFloat in
                return cls(tableView, section)
            }
            
            blocks["tableView:estimatedHeightForFooterInSection:"] =
                unsafeBitCast(_tableViewEstimatedHeightForFooterInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->CGFloat, to: AnyObject.self)
        }
        
        if let cls = viewForHeaderInSection {
            let _tableViewViewForHeaderInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> UIView? in
                return cls(tableView, section)
            }
            
            blocks["tableView:viewForHeaderInSection:"] =
                unsafeBitCast(_tableViewViewForHeaderInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->UIView?, to: AnyObject.self)
        }
        
        if let cls = viewForFooterInSection {
            let _tableViewViewForFooterInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> UIView? in
                return cls(tableView, section)
            }
            
            blocks["tableView:viewForFooterInSection:"] =
                unsafeBitCast(_tableViewViewForFooterInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->UIView?, to: AnyObject.self)
        }
        
        if let cls = accessoryButtonTappedForRowWithIndexPath {
            let _tableViewAccessoryButtonTappedForRowWithIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:accessoryButtonTappedForRowWithIndexPath:"] =
                unsafeBitCast(_tableViewAccessoryButtonTappedForRowWithIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = shouldHighlightRowAtIndexPath {
            let _tableViewShouldHighlightRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> Bool in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:shouldHighlightRowAtIndexPath:"] =
                unsafeBitCast(_tableViewShouldHighlightRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->Bool, to: AnyObject.self)
        }
        
        if let cls = didHighlightRowAtIndexPath {
            let _tableViewDidHighlightRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:didHighlightRowAtIndexPath:"] =
                unsafeBitCast(_tableViewDidHighlightRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = didUnhighlightRowAtIndexPath {
            let _tableViewDidUnhighlightRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:didUnhighlightRowAtIndexPath:"] =
                unsafeBitCast(_tableViewDidUnhighlightRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = willSelectRowAtIndexPath {
            let _tableViewWillSelectRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> NSIndexPath? in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:willSelectRowAtIndexPath:"] =
                unsafeBitCast(_tableViewWillSelectRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->NSIndexPath?, to: AnyObject.self)
        }
        
        if let cls = willDeselectRowAtIndexPath {
            let _tableViewWillDeselectRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> NSIndexPath? in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:willDeselectRowAtIndexPath:"] =
                unsafeBitCast(_tableViewWillDeselectRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->NSIndexPath?, to: AnyObject.self)
        }
        
        if let cls = didSelectRowAtIndexPath {
            let _tableViewDidSelectRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:didSelectRowAtIndexPath:"] =
                unsafeBitCast(_tableViewDidSelectRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = didDeselectRowAtIndexPath {
            let _tableViewDidDeselectRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:didDeselectRowAtIndexPath:"] =
                unsafeBitCast(_tableViewDidDeselectRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = editingStyleForRowAtIndexPath {
            let _tableViewEditingStyleForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell.EditingStyle in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:editingStyleForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewEditingStyleForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->UITableViewCell.EditingStyle, to: AnyObject.self)
        }
        
        if let cls = titleForDeleteConfirmationButtonForRowAtIndexPath {
            let _tableViewTitleForDeleteConfirmationButtonForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> String? in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:titleForDeleteConfirmationButtonForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewTitleForDeleteConfirmationButtonForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath) -> String?, to: AnyObject.self)
        }
        
        if let cls = editActionsForRowAtIndexPath {
            let _tableViewEditActionsForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> [AnyObject]? in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:editActionsForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewEditActionsForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->[AnyObject]?, to: AnyObject.self)
        }
        
        if let cls = shouldIndentWhileEditingRowAtIndexPath {
            let _tableViewShouldIndentWhileEditingRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> Bool in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:shouldIndentWhileEditingRowAtIndexPath:"] =
                unsafeBitCast(_tableViewShouldIndentWhileEditingRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->Bool, to: AnyObject.self)
        }
        
        if let cls = willBeginEditingRowAtIndexPath {
            let _tableViewWillBeginEditingRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:willBeginEditingRowAtIndexPath:"] =
                unsafeBitCast(_tableViewWillBeginEditingRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = didEndEditingRowAtIndexPath {
            let _tableViewDidEndEditingRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:didEndEditingRowAtIndexPath:"] =
                unsafeBitCast(_tableViewDidEndEditingRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = targetIndexPathForMoveFromRowAtIndexPath {
            let _tableViewTargetIndexPathForMoveFromRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, sourceIndexPath: NSIndexPath, proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath in
                return cls(tableView, sourceIndexPath, proposedDestinationIndexPath)
            }
            
            blocks["tableView:targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath:"] =
                unsafeBitCast(_tableViewTargetIndexPathForMoveFromRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath, NSIndexPath)->NSIndexPath, to: AnyObject.self)
        }
        
        if let cls = indentationLevelForRowAtIndexPath {
            let _tableViewIndentationLevelForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> Int in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:indentationLevelForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewIndentationLevelForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->Int, to: AnyObject.self)
        }
        
        if let cls = shouldShowMenuForRowAtIndexPath {
            let _tableViewShouldShowMenuForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> Bool in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:shouldShowMenuForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewShouldShowMenuForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->Bool, to: AnyObject.self)
        }
        
        if let cls = canPerformAction {
            let _tableViewCanPerformAction = {(obj: BaseDelegateObject, tableView: UITableView, action: Selector, indexPath: NSIndexPath, sender: AnyObject) -> Bool in
                return cls(tableView, action, indexPath, sender)
            }
            
            blocks["tableView:canPerformAction:forRowAtIndexPath:withSender:"] =
                unsafeBitCast(_tableViewCanPerformAction as @convention(block) (BaseDelegateObject, UITableView, Selector, NSIndexPath, AnyObject)->Bool, to: AnyObject.self)
        }
        
        if let cls = performAction {
            let _tableViewPerformAction = {(obj: BaseDelegateObject, tableView: UITableView, action: Selector, indexPath: NSIndexPath, sender: AnyObject!) -> () in
                return cls(tableView, action, indexPath, sender)
            }
            
            blocks["tableView:performAction:forRowAtIndexPath:withSender:"] =
                unsafeBitCast(_tableViewPerformAction as @convention(block) (BaseDelegateObject, UITableView, Selector, NSIndexPath, AnyObject)->(), to: AnyObject.self)
        }
        self.setClosureToDelegate(tableViewDelegate: blocks)
    }
}
