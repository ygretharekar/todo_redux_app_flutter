import 'package:flutter/material.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:todo_redux_app/keys/keys.dart';

class FilterButton extends StatelessWidget {
  final PopupMenuItemSelected<VisibilityFilter> onSelected;
  final VisibilityFilter activeFilter;
  final bool visible;

  FilterButton(
    {
      this.onSelected,
      this.activeFilter,
      this.visible,
      Key key
    }
  ):super(key: key);

  @override
  Widget build(BuildContext context) {

    final defaultStyle = Theme.of(context).textTheme.body1;
    final activeStyle = Theme
        .of(context)
        .textTheme
        .body1
        .copyWith(color: Theme.of(context).accentColor);

    return new AnimatedOpacity(
        opacity: visible ? 1.0: 0.0,
        duration: new Duration(milliseconds: 200),
        child: new PopupMenuButton<VisibilityFilter>(
            key: Keys.filterButton,
            tooltip: 'Filter Todos',
            onSelected: onSelected,
            itemBuilder: (BuildContext context) =>
                <PopupMenuItem<VisibilityFilter>>[
                  new PopupMenuItem(
                      key: Keys.allFilter,
                      value: VisibilityFilter.all,
                      child: new Text(
                          "All Todos",
                          style:
                            activeFilter == VisibilityFilter.all ?
                                activeStyle:
                                defaultStyle,
                      )
                  ),
                  new PopupMenuItem(
                      key: Keys.activeFilter,
                      value: VisibilityFilter.active,
                      child: new Text(
                          "Active Todos",
                          style:
                            activeFilter == VisibilityFilter.active ?
                                activeStyle:
                                defaultStyle,
                      )
                  ),
                  new PopupMenuItem(
                      key: Keys.completedFilter,
                      value: VisibilityFilter.completed,
                      child: new Text(
                          "Completed Todos",
                          style:
                            activeFilter == VisibilityFilter.active ?
                                activeStyle:
                                defaultStyle,
                      )
                  ),
                ],
                icon: new Icon(Icons.filter_list),

        ),

    );
  }

}