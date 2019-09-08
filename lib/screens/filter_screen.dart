import 'package:flutter/material.dart';
import 'package:great_meals/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static final String routeName = '/filter';
  final Map<String, bool> filters;
  final Function handleChangeFilter;
  const FilterScreen(this.filters, this.handleChangeFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _gluten = false;
  bool _vegan = false;
  bool _vegeterian = false;
  bool _lactose = false;

  void initState() {
    super.initState();

    _gluten = widget.filters['gluten'];
    _vegan = widget.filters['vegan'];
    _vegeterian = widget.filters['vegeterian'];
    _lactose = widget.filters['lactose'];
  }

  void _handleChangeFilter() {
    widget.handleChangeFilter({
      'gluten': _gluten,
      'vegan': _vegan,
      'vegeterian': _vegeterian,
      'lactose': _lactose,
    });

    Navigator.of(context).pushNamed('/');
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool value, Function handleChange) {
    return Builder(
      builder: (context) {
        return SwitchListTile(
          subtitle: Text(
            subtitle,
            style: Theme.of(context).textTheme.body2,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.body1,
          ),
          value: value,
          onChanged: handleChange,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hi'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Adjust meal selection',
                style: Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten free',
                  'Only includes gluten meals.',
                  _gluten,
                  (value) {
                    setState(() {
                      this._gluten = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only includes vegan meals.',
                  _vegan,
                  (value) {
                    setState(() {
                      this._vegan = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only includes vegetarian meals.',
                  _vegeterian,
                  (value) {
                    setState(() {
                      this._vegeterian = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only includes lactose-free meals.',
                  _lactose,
                  (value) {
                    setState(() {
                      this._lactose = value;
                    });
                  },
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('Update filter'),
                  onPressed: _handleChangeFilter,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
