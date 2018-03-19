//
//  UITableView+Closure.swift
//  ClosureUtil
//
//  Created by Shunsaku Miki on 2018/03/18.
//  Copyright © 2018年 Shunsaku Miki. All rights reserved.
//

import UIKit

extension UITableView {
    
    // MARK: - dataSource
    
    /// Closureを設定
    ///
    /// - Parameters:
    ///   - numberOfRowsInSection:
    ///   - cellForRowAtIndexPath:
    ///   - numberOfSectionsInTableView:
    ///   - tableViewTitleForHeaderInSection:
    ///   - tableViewTitleForFooterInSection:
    ///   - tableViewCanEditRowAtIndexPath:
    ///   - tableViewCanMoveRowAtIndexPath:
    ///   - sectionIndexTitlesForTableView:
    ///   - tableViewSectionForSectionIndexTitle:
    ///   - tableViewCommitEditingStyle:
    ///   - tableViewMoveRowAtIndexPath:
    func setClosureToDataSource(
        numberOfRowsInSection: @escaping ((_ tableView: UITableView, _ section: Int) -> Int),
        cellForRowAtIndexPath: @escaping ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> UITableViewCell),
        numberOfSectionsInTableView: ((_ tableView: UITableView) -> Int)? = nil,
        tableViewTitleForHeaderInSection: ((_ tableView: UITableView, _ section: Int) -> String?)? = nil,
        tableViewTitleForFooterInSection: ((_ tableView: UITableView, _ section: Int) -> String?)? = nil,
        tableViewCanEditRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> Bool)? = nil,
        tableViewCanMoveRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> Bool)? = nil,
        sectionIndexTitlesForTableView: ((_ tableView: UITableView) -> [String]?)? = nil,
        tableViewSectionForSectionIndexTitle: ((_ tableView: UITableView, _ title: String, _ index: Int) -> Int)? = nil,
        tableViewCommitEditingStyle: ((_ tableView: UITableView, _ editingStyle: UITableViewCellEditingStyle, _ indexPath: NSIndexPath) -> ())? = nil,
        tableViewMoveRowAtIndexPath: ((_ tableView: UITableView, _ sourceIndexPath: NSIndexPath, _ destinationIndexPath: NSIndexPath) -> ())? = nil
        ) {
        
        var blocks = [String: AnyObject]()
        
        let _numberOfRowsInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> Int in
            return numberOfRowsInSection(tableView, section)
        }
        blocks["tableView:numberOfRowsInSection:"] =
            unsafeBitCast(_numberOfRowsInSection as @convention(block) (BaseDelegateObject, UITableView, Int) -> Int, to: AnyObject.self)
        
        let _cellForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell in
            return cellForRowAtIndexPath(tableView, indexPath)
        }
        blocks["tableView:cellForRowAtIndexPath:"] =
            unsafeBitCast(_cellForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath) -> UITableViewCell, to: AnyObject.self)
        
        if let cls = numberOfSectionsInTableView {
            let _numberOfSectionsInTableView = {(obj: BaseDelegateObject, tableView: UITableView) -> Int in
                return cls(tableView)
            }
            blocks["numberOfSectionsInTableView:"] =
                unsafeBitCast(_numberOfSectionsInTableView as @convention(block) (BaseDelegateObject, UITableView)->Int, to: AnyObject.self)
        }
        
        if let cls = tableViewTitleForHeaderInSection {
            let _tableViewTitleForHeaderInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> String? in
                return cls(tableView, section)
            }
            blocks["tableView:titleForHeaderInSection:"] =
                unsafeBitCast(_tableViewTitleForHeaderInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->String?, to: AnyObject.self)
        }
        
        if let cls = tableViewTitleForFooterInSection {
            let _tableViewTitleForFooterInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> String? in
                return cls(tableView, section)
            }
            blocks["tableView:titleForFooterInSection:"] =
                unsafeBitCast(_tableViewTitleForFooterInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->String?, to: AnyObject.self)
        }
        
        if let cls = tableViewCanEditRowAtIndexPath {
            let _tableViewCanEditRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> Bool in
                return cls(tableView, indexPath)
            }
            blocks["tableView:canEditRowAtIndexPath:"] =
                unsafeBitCast(_tableViewCanEditRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->Bool, to: AnyObject.self)
        }
        
        if let cls = tableViewCanMoveRowAtIndexPath {
            let _tableViewCanMoveRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> Bool in
                return cls(tableView, indexPath)
            }
            blocks["tableView:canMoveRowAtIndexPath:"] =
                unsafeBitCast(_tableViewCanMoveRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->Bool, to: AnyObject.self)
        }
        
        if let cls = sectionIndexTitlesForTableView {
            let _sectionIndexTitlesForTableView = {(obj: BaseDelegateObject, tableView: UITableView) -> [String]? in
                return cls(tableView)
            }
            blocks["sectionIndexTitlesForTableView:"] =
                unsafeBitCast(_sectionIndexTitlesForTableView as @convention(block) (BaseDelegateObject, UITableView)->[String]?, to: AnyObject.self)
        }
        
        if let cls = tableViewSectionForSectionIndexTitle {
            let _tableViewSectionForSectionIndexTitle = {(obj: BaseDelegateObject, tableView: UITableView, title: String, index: Int) -> Int in
                return cls(tableView, title, index)
            }
            blocks["tableView:sectionForSectionIndexTitle:atIndex:"] =
                unsafeBitCast(_tableViewSectionForSectionIndexTitle as @convention(block) (BaseDelegateObject, UITableView, String, Int)->Int, to: AnyObject.self)
        }
        
        if let cls = tableViewCommitEditingStyle {
            let _tableViewCommitEditingStyle = {(obj: BaseDelegateObject, tableView: UITableView, editingStyle: UITableViewCellEditingStyle, indexPath: NSIndexPath) -> () in
                return cls(tableView, editingStyle, indexPath)
            }
            blocks["tableView:commitEditingStyle:forRowAtIndexPath:"] =
                unsafeBitCast(_tableViewCommitEditingStyle as @convention(block) (BaseDelegateObject, UITableView, UITableViewCellEditingStyle, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewMoveRowAtIndexPath {
            let _tableViewMoveRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, sourceIndexPath: NSIndexPath, destinationIndexPath: NSIndexPath) -> () in
                return cls(tableView, sourceIndexPath, destinationIndexPath)
            }
            blocks["tableView:moveRowAtIndexPath:toIndexPath:"] =
                unsafeBitCast(_tableViewMoveRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath, NSIndexPath)->(), to: AnyObject.self)
        }
        
        self.setClosureToDataSource(blocks: blocks)
    }
    
    /**
     ClosureをdataSourceに設定
     
     :param: blocks Closure
     */
    func setClosureToDataSource(blocks: [String: AnyObject]) {
        self.dataSource =
            BaseDelegateObject.generate(self, for: UITableViewDataSource.self, blocks: blocks) as? UITableViewDataSource
    }
    
    // MARK: - delegate
    
    func setClosureToDelegate(
        tableViewWillDisplayCell: ((_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: NSIndexPath) -> ())? = nil,
        tableViewWillDisplayHeaderView: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> ())? = nil,
        tableViewWillDisplayFooterView: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> ())? = nil,
        tableViewDidEndDisplayingCell: ((_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: NSIndexPath) -> ())? = nil,
        tableViewDidEndDisplayingHeaderView: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> ())? = nil,
        tableViewDidEndDisplayingFooterView: ((_ tableView: UITableView, _ view: UIView, _ section: Int) -> ())? = nil,
        tableViewHeightForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> CGFloat)? = nil,
        tableViewHeightForHeaderInSection: ((_ tableView: UITableView, _ section: Int) -> CGFloat)? = nil,
        tableViewHeightForFooterInSection: ((_ tableView: UITableView, _ section: Int) -> CGFloat)? = nil,
        tableViewEstimatedHeightForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> CGFloat)? = nil,
        tableViewEstimatedHeightForHeaderInSection: ((_ tableView: UITableView, _ section: Int) -> CGFloat)? = nil,
        tableViewEstimatedHeightForFooterInSection: ((_ tableView: UITableView, _ section: Int) -> CGFloat)? = nil,
        tableViewViewForHeaderInSection: ((_ tableView: UITableView, _ section: Int) -> UIView?)? = nil,
        tableViewViewForFooterInSection: ((_ tableView: UITableView, _ section: Int) -> UIView?)? = nil,
        tableViewAccessoryButtonTappedForRowWithIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        tableViewShouldHighlightRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> Bool)? = nil,
        tableViewDidHighlightRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        tableViewDidUnhighlightRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        tableViewWillSelectRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> NSIndexPath?)? = nil,
        tableViewWillDeselectRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> NSIndexPath?)? = nil,
        tableViewDidSelectRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        tableViewDidDeselectRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        tableViewEditingStyleForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> UITableViewCellEditingStyle)? = nil,
        tableViewTitleForDeleteConfirmationButtonForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> String?)? = nil,
        tableViewEditActionsForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> [UITableViewRowAction]?)? = nil,
        tableViewShouldIndentWhileEditingRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> Bool)? = nil,
        tableViewWillBeginEditingRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        tableViewDidEndEditingRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> ())? = nil,
        tableViewTargetIndexPathForMoveFromRowAtIndexPath: ((_ tableView: UITableView, _ sourceIndexPath: NSIndexPath, _ proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath)? = nil,
        tableViewIndentationLevelForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> Int)? = nil,
        tableViewShouldShowMenuForRowAtIndexPath: ((_ tableView: UITableView, _ indexPath: NSIndexPath) -> Bool)? = nil,
        tableViewCanPerformAction: ((_ tableView: UITableView, _ action: Selector, _ indexPath: NSIndexPath, _ sender: AnyObject?) -> Bool)? = nil,
        tableViewPerformAction: ((_ tableView: UITableView, _ action: Selector, _ indexPath: NSIndexPath, _ sender: AnyObject?) -> ())? = nil,
        scrollViewDidScroll: ((_ scrollView: UIScrollView) -> ())? = nil,
        scrollViewDidZoom: ((_ scrollView: UIScrollView) -> ())? = nil,
        scrollViewWillBeginDragging: ((_ scrollView: UIScrollView) -> ())? = nil,
        scrollViewWillEndDragging: ((_ scrollView: UIScrollView, _ velocity: CGPoint, _ targetContentOffset: UnsafeMutablePointer<CGPoint>) -> ())? = nil,
        scrollViewDidEndDragging: ((_ scrollView: UIScrollView, _ decelerate: Bool) -> ())? = nil,
        scrollViewWillBeginDecelerating: ((_ scrollView: UIScrollView) -> ())? = nil,
        scrollViewDidEndDecelerating: ((_ scrollView: UIScrollView) -> ())? = nil,
        scrollViewDidEndScrollingAnimation: ((_ scrollView: UIScrollView) -> ())? = nil,
        viewForZoomingInScrollView: ((_ scrollView: UIScrollView) -> UIView?)? = nil,
        scrollViewWillBeginZooming: ((_ scrollView: UIScrollView, _ view: UIView?) -> ())? = nil,
        scrollViewDidEndZooming: ((_ scrollView: UIScrollView, _ view: UIView?, _ scale: CGFloat) -> ())? = nil,
        scrollViewShouldScrollToTop: ((_ scrollView: UIScrollView) -> Bool)? = nil,
        scrollViewDidScrollToTop: ((_ scrollView: UIScrollView) -> ())? = nil
        ) {
        
        var blocks = [String: AnyObject]()
        
        if let cls = tableViewWillDisplayCell {
            let _tableViewWillDisplayCell = {(obj: BaseDelegateObject, tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath) -> () in
                return cls(tableView, cell, indexPath)
            }
            blocks["tableView:willDisplayCell:forRowAtIndexPath:"] =
                unsafeBitCast(_tableViewWillDisplayCell as @convention(block) (BaseDelegateObject, UITableView, UITableViewCell, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewWillDisplayHeaderView {
            let _tableViewWillDisplayHeaderView = {(obj: BaseDelegateObject, tableView: UITableView, view: UIView, section: Int) -> () in
                return cls(tableView, view, section)
            }
            blocks["tableView:willDisplayHeaderView:forSection:"] =
                unsafeBitCast(_tableViewWillDisplayHeaderView as @convention(block) (BaseDelegateObject, UITableView, UIView, Int)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewWillDisplayFooterView {
            let _tableViewWillDisplayFooterView = {(obj: BaseDelegateObject, tableView: UITableView, view: UIView, section: Int) -> () in
                return cls(tableView, view, section)
            }
            blocks["tableView:willDisplayFooterView:forSection:"] =
                unsafeBitCast(_tableViewWillDisplayFooterView as @convention(block) (BaseDelegateObject, UITableView, UIView, Int)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewDidEndDisplayingCell {
            let _tableViewDidEndDisplayingCell = {(obj: BaseDelegateObject, tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath) -> () in
                return cls(tableView, cell, indexPath)
            }
            blocks["tableView:didEndDisplayingCell:forRowAtIndexPath:"] =
                unsafeBitCast(_tableViewDidEndDisplayingCell as @convention(block) (BaseDelegateObject, UITableView, UITableViewCell, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewDidEndDisplayingHeaderView {
            let _tableViewDidEndDisplayingHeaderView = {(obj: BaseDelegateObject, tableView: UITableView, view: UIView, section: Int) -> () in
                return cls(tableView, view, section)
            }
            blocks["tableView:didEndDisplayingHeaderView:forSection:"] =
                unsafeBitCast(_tableViewDidEndDisplayingHeaderView as @convention(block) (BaseDelegateObject, UITableView, UIView, Int)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewDidEndDisplayingFooterView {
            let _tableViewDidEndDisplayingFooterView = {(obj: BaseDelegateObject, tableView: UITableView, view: UIView, section: Int) -> () in
                return cls(tableView, view, section)
            }
            
            blocks["tableView:didEndDisplayingFooterView:forSection:"] =
                unsafeBitCast(_tableViewDidEndDisplayingFooterView as @convention(block) (BaseDelegateObject, UITableView, UIView, Int)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewHeightForRowAtIndexPath {
            let _tableViewHeightForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> CGFloat in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:heightForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewHeightForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->CGFloat, to: AnyObject.self)
        }
        
        if let cls = tableViewHeightForHeaderInSection {
            let _tableViewHeightForHeaderInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> CGFloat in
                return cls(tableView, section)
            }
            
            blocks["tableView:heightForHeaderInSection:"] =
                unsafeBitCast(_tableViewHeightForHeaderInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->CGFloat, to: AnyObject.self)
        }
        
        if let cls = tableViewHeightForFooterInSection {
            let _tableViewHeightForFooterInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> CGFloat in
                return cls(tableView, section)
            }
            
            blocks["tableView:heightForFooterInSection:"] =
                unsafeBitCast(_tableViewHeightForFooterInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->CGFloat, to: AnyObject.self)
        }
        
        if let cls = tableViewEstimatedHeightForRowAtIndexPath {
            let _tableViewEstimatedHeightForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> CGFloat in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:estimatedHeightForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewEstimatedHeightForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(CGFloat), to: AnyObject.self)
        }
        
        if let cls = tableViewEstimatedHeightForHeaderInSection {
            let _tableViewEstimatedHeightForHeaderInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> CGFloat in
                return cls(tableView, section)
            }
            
            blocks["tableView:estimatedHeightForHeaderInSection:"] =
                unsafeBitCast(_tableViewEstimatedHeightForHeaderInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->CGFloat, to: AnyObject.self)
        }
        
        if let cls = tableViewEstimatedHeightForFooterInSection {
            let _tableViewEstimatedHeightForFooterInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> CGFloat in
                return cls(tableView, section)
            }
            
            blocks["tableView:estimatedHeightForFooterInSection:"] =
                unsafeBitCast(_tableViewEstimatedHeightForFooterInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->CGFloat, to: AnyObject.self)
        }
        
        if let cls = tableViewViewForHeaderInSection {
            let _tableViewViewForHeaderInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> UIView? in
                return cls(tableView, section)
            }
            
            blocks["tableView:viewForHeaderInSection:"] =
                unsafeBitCast(_tableViewViewForHeaderInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->UIView?, to: AnyObject.self)
        }
        
        if let cls = tableViewViewForFooterInSection {
            let _tableViewViewForFooterInSection = {(obj: BaseDelegateObject, tableView: UITableView, section: Int) -> UIView? in
                return cls(tableView, section)
            }
            
            blocks["tableView:viewForFooterInSection:"] =
                unsafeBitCast(_tableViewViewForFooterInSection as @convention(block) (BaseDelegateObject, UITableView, Int)->UIView?, to: AnyObject.self)
        }
        
        if let cls = tableViewAccessoryButtonTappedForRowWithIndexPath {
            let _tableViewAccessoryButtonTappedForRowWithIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:accessoryButtonTappedForRowWithIndexPath:"] =
                unsafeBitCast(_tableViewAccessoryButtonTappedForRowWithIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewShouldHighlightRowAtIndexPath {
            let _tableViewShouldHighlightRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> Bool in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:shouldHighlightRowAtIndexPath:"] =
                unsafeBitCast(_tableViewShouldHighlightRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->Bool, to: AnyObject.self)
        }
        
        if let cls = tableViewDidHighlightRowAtIndexPath {
            let _tableViewDidHighlightRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:didHighlightRowAtIndexPath:"] =
                unsafeBitCast(_tableViewDidHighlightRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewDidUnhighlightRowAtIndexPath {
            let _tableViewDidUnhighlightRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:didUnhighlightRowAtIndexPath:"] =
                unsafeBitCast(_tableViewDidUnhighlightRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewWillSelectRowAtIndexPath {
            let _tableViewWillSelectRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> NSIndexPath? in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:willSelectRowAtIndexPath:"] =
                unsafeBitCast(_tableViewWillSelectRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->NSIndexPath?, to: AnyObject.self)
        }
        
        if let cls = tableViewWillDeselectRowAtIndexPath {
            let _tableViewWillDeselectRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> NSIndexPath? in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:willDeselectRowAtIndexPath:"] =
                unsafeBitCast(_tableViewWillDeselectRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->NSIndexPath?, to: AnyObject.self)
        }
        
        if let cls = tableViewDidSelectRowAtIndexPath {
            let _tableViewDidSelectRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:didSelectRowAtIndexPath:"] =
                unsafeBitCast(_tableViewDidSelectRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewDidDeselectRowAtIndexPath {
            let _tableViewDidDeselectRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:didDeselectRowAtIndexPath:"] =
                unsafeBitCast(_tableViewDidDeselectRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewEditingStyleForRowAtIndexPath {
            let _tableViewEditingStyleForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCellEditingStyle in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:editingStyleForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewEditingStyleForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->UITableViewCellEditingStyle, to: AnyObject.self)
        }
        
        if let cls = tableViewTitleForDeleteConfirmationButtonForRowAtIndexPath {
            let _tableViewTitleForDeleteConfirmationButtonForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> String! in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:titleForDeleteConfirmationButtonForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewTitleForDeleteConfirmationButtonForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->String!, to: AnyObject.self)
        }
        
        if let cls = tableViewEditActionsForRowAtIndexPath {
            let _tableViewEditActionsForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> [AnyObject]? in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:editActionsForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewEditActionsForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->[AnyObject]?, to: AnyObject.self)
        }
        
        if let cls = tableViewShouldIndentWhileEditingRowAtIndexPath {
            let _tableViewShouldIndentWhileEditingRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> Bool in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:shouldIndentWhileEditingRowAtIndexPath:"] =
                 unsafeBitCast(_tableViewShouldIndentWhileEditingRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->Bool, to: AnyObject.self)
        }
        
        if let cls = tableViewWillBeginEditingRowAtIndexPath {
            let _tableViewWillBeginEditingRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:willBeginEditingRowAtIndexPath:"] =
                unsafeBitCast(_tableViewWillBeginEditingRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewDidEndEditingRowAtIndexPath {
            let _tableViewDidEndEditingRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> () in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:didEndEditingRowAtIndexPath:"] =
                unsafeBitCast(_tableViewDidEndEditingRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->(), to: AnyObject.self)
        }
        
        if let cls = tableViewTargetIndexPathForMoveFromRowAtIndexPath {
            let _tableViewTargetIndexPathForMoveFromRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, sourceIndexPath: NSIndexPath, proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath in
                return cls(tableView, sourceIndexPath, proposedDestinationIndexPath)
            }
            
            blocks["tableView:targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath:"] =
                unsafeBitCast(_tableViewTargetIndexPathForMoveFromRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath, NSIndexPath)->NSIndexPath, to: AnyObject.self)
        }
        
        if let cls = tableViewIndentationLevelForRowAtIndexPath {
            let _tableViewIndentationLevelForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> Int in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:indentationLevelForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewIndentationLevelForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->Int, to: AnyObject.self)
        }
        
        if let cls = tableViewShouldShowMenuForRowAtIndexPath {
            let _tableViewShouldShowMenuForRowAtIndexPath = {(obj: BaseDelegateObject, tableView: UITableView, indexPath: NSIndexPath) -> Bool in
                return cls(tableView, indexPath)
            }
            
            blocks["tableView:shouldShowMenuForRowAtIndexPath:"] =
                unsafeBitCast(_tableViewShouldShowMenuForRowAtIndexPath as @convention(block) (BaseDelegateObject, UITableView, NSIndexPath)->Bool, to: AnyObject.self)
        }
        
        if let cls = tableViewCanPerformAction {
            let _tableViewCanPerformAction = {(obj: BaseDelegateObject, tableView: UITableView, action: Selector, indexPath: NSIndexPath, sender: AnyObject) -> Bool in
                return cls(tableView, action, indexPath, sender)
            }
            
            blocks["tableView:canPerformAction:forRowAtIndexPath:withSender:"] =
                unsafeBitCast(_tableViewCanPerformAction as @convention(block) (BaseDelegateObject, UITableView, Selector, NSIndexPath, AnyObject)->Bool, to: AnyObject.self)
        }
        
        if let cls = tableViewPerformAction {
            let _tableViewPerformAction = {(obj: BaseDelegateObject, tableView: UITableView, action: Selector, indexPath: NSIndexPath, sender: AnyObject!) -> () in
                return cls(tableView, action, indexPath, sender)
            }
            
            blocks["tableView:performAction:forRowAtIndexPath:withSender:"] =
                unsafeBitCast(_tableViewPerformAction as @convention(block) (BaseDelegateObject, UITableView, Selector, NSIndexPath, AnyObject)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewDidScroll {
            let _scrollViewDidScroll = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidScroll:"] =
                unsafeBitCast(_scrollViewDidScroll as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewDidZoom {
            let _scrollViewDidZoom = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidZoom:"] =
                unsafeBitCast(_scrollViewDidZoom as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewWillBeginDragging {
            let _scrollViewWillBeginDragging = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewWillBeginDragging:"] =
                unsafeBitCast(_scrollViewWillBeginDragging as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewWillEndDragging {
            let _scrollViewWillEndDragging = {(obj: BaseDelegateObject, scrollView: UIScrollView, velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) -> () in
                return cls(scrollView, velocity, targetContentOffset)
            }
            blocks["scrollViewWillEndDragging:withVelocity:targetContentOffset:"] =
                unsafeBitCast(_scrollViewWillEndDragging as @convention(block) (BaseDelegateObject, UIScrollView, CGPoint, UnsafeMutablePointer<CGPoint>)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewDidEndDragging {
            let _scrollViewDidEndDragging = {(obj: BaseDelegateObject, scrollView: UIScrollView, decelerate: Bool) -> () in
                return cls(scrollView, decelerate)
            }
            blocks["scrollViewDidEndDragging:willDecelerate:"] =
                unsafeBitCast(_scrollViewDidEndDragging as @convention(block) (BaseDelegateObject, UIScrollView, Bool)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewWillBeginDecelerating {
            let _scrollViewWillBeginDecelerating = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewWillBeginDecelerating:"] =
                unsafeBitCast(_scrollViewWillBeginDecelerating as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewDidEndDecelerating {
            let _scrollViewDidEndDecelerating = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidEndDecelerating:"] =
                unsafeBitCast(_scrollViewDidEndDecelerating as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewDidEndScrollingAnimation {
            let _scrollViewDidEndScrollingAnimation = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidEndScrollingAnimation:"] =
                unsafeBitCast(_scrollViewDidEndScrollingAnimation as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        if let cls = viewForZoomingInScrollView {
            let _viewForZoomingInScrollView = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> UIView? in
                return cls(scrollView)
            }
            blocks["viewForZoomingInScrollView:"] =
                unsafeBitCast(_viewForZoomingInScrollView as @convention(block) (BaseDelegateObject, UIScrollView)->UIView?, to: AnyObject.self)
        }
        
        if let cls = scrollViewWillBeginZooming {
            let _scrollViewWillBeginZooming = {(obj: BaseDelegateObject, scrollView: UIScrollView, view: UIView?) -> () in
                return cls(scrollView, view)
            }
            blocks["scrollViewWillBeginZooming:withView:"] =
                unsafeBitCast(_scrollViewWillBeginZooming as @convention(block) (BaseDelegateObject, UIScrollView, UIView?)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewDidEndZooming {
            let _scrollViewDidEndZooming = {(obj: BaseDelegateObject, scrollView: UIScrollView, view: UIView?, scale: CGFloat) -> () in
                return cls(scrollView, view, scale)
            }
            blocks["scrollViewDidEndZooming:withView:atScale:"] =
                unsafeBitCast(_scrollViewDidEndZooming as @convention(block) (BaseDelegateObject, UIScrollView, UIView?, CGFloat)->(), to: AnyObject.self)
        }
        
        if let cls = scrollViewShouldScrollToTop {
            let _scrollViewShouldScrollToTop = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> Bool in
                return cls(scrollView)
            }
            blocks["scrollViewShouldScrollToTop:"] =
                unsafeBitCast(_scrollViewShouldScrollToTop as @convention(block) (BaseDelegateObject, UIScrollView)->Bool, to: AnyObject.self)
        }
        
        if let cls = scrollViewDidScrollToTop {
            let _scrollViewDidScrollToTop = {(obj: BaseDelegateObject, scrollView: UIScrollView) -> () in
                return cls(scrollView)
            }
            blocks["scrollViewDidScrollToTop:"] =
                unsafeBitCast(_scrollViewDidScrollToTop as @convention(block) (BaseDelegateObject, UIScrollView)->(), to: AnyObject.self)
        }
        
        self.setClosureToDelegate(tableViewDelegate: blocks)
    }
    
    func setClosureToDelegate(tableViewDelegate blocks: [String: AnyObject]) {
        self.delegate = BaseDelegateObject.generate(self, for: UITableViewDelegate.self, blocks: blocks) as? UITableViewDelegate
    }
}
